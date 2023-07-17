import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme.dart';
import 'package:flutter_template_project/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CounterCubit>(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) => Scaffold(
          body: Center(
            child: Text(
              'Counter value: $state',
              style: AppTheme.of(context).textTheme.headline2,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
            backgroundColor: AppTheme.of(context).colorTheme.primary,
            foregroundColor: AppTheme.of(context).colorTheme.onPrimary,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
