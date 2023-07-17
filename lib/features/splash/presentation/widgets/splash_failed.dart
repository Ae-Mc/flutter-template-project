import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_event.dart';

class SplashFailed extends StatelessWidget {
  const SplashFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FlutterLogo(size: 128),
        FloatingActionButton(
          onPressed: () => BlocProvider.of<SplashBloc>(context)
              .add(const SplashEvent.retryInitialization()),
          backgroundColor: AppTheme.of(context).colorTheme.primary,
          foregroundColor: AppTheme.of(context).colorTheme.onPrimary,
          child: const Icon(Icons.replay),
        ),
      ],
    );
  }
}
