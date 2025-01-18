import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app_frontend/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:video_call_app_frontend/presentation/cubits/login_cubit/login_state.dart';

import '../../di/get_it.dart';
import '../../routes/app_routes.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  final Function(bool) onResult;
  const LoginScreen({super.key, required this.onResult});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: this,
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String identifier = _identifierController.text.trim();
    String password = _passwordController.text.trim();

    if (identifier.isEmpty) {
      _showError('Please enter your username or phone number');
      return;
    }

    if (password.isEmpty) {
      _showError('Please enter your password');
      return;
    }
    context
        .read<LoginCubit>()
        .login(identifier: identifier, password: password);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginError) {
          _showError(state.message);
        } else if (state is LoginSuccess) {
          // AutoRouter.of(context).replace(VideoCallRoute());
          widget.onResult(true);
          context.maybePop();
        }
      }, builder: (context, state) {
        if (state is LoginLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _identifierController,
                decoration: InputDecoration(
                  labelText: 'Username or Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
