import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app_frontend/presentation/cubits/new_cubit/new_cubit.dart';
import 'package:video_call_app_frontend/presentation/cubits/new_cubit/new_state.dart';

import '../../di/get_it.dart';

@RoutePage()
class NewScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewCubit>(),
      child: this,
    );
  }
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewCubit, NewState>(builder: (context, state) {
        if (state is NewLoading) {
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewSuccess) {
          return Center(
            child: Text("Success"),
          );
        }
        return Center(
          child: Column(
            children: [
              Center(
                child: Text("Initial"),
              ),
              TextButton(
                  onPressed: () {
                    context.read<NewCubit>().getSuccess();
                  },
                  child: Text("Prease Press..."))
            ],
          ),
        );
      }),
    );
  }
}
