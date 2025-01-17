import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/signup_cubit/signup_cubit.dart';
import '../cubits/signup_cubit/signup_state.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            // Your listener code
          },
          builder: (context, state) {
            if (state is SignupLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Text("HEllo"),
            );
          },
        ),
      ),
    );
  }
}
