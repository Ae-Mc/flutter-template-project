import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router/app_router.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme_bloc.dart';
import 'package:flutter_template_project/features/splash/data/repositories/startup_repository_impl.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_template_project/features/splash/presentation/pages/splash_page.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppThemeBloc()),
        BlocProvider(create: (context) => SplashBloc(StartupRepositoryImpl())),
      ],
      child: BlocBuilder<AppThemeBloc, AppTheme>(
        builder: (context, state) => MaterialApp(
          // TODO: Change app title
          title: "Flutter template project",
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) => Scaffold(
              body: SafeArea(
                child: state.maybeWhen(
                  initialized: () => Router(
                    routeInformationParser:
                        GetIt.I.get<AppRouter>().defaultRouteParser(),
                    routeInformationProvider:
                        GetIt.I.get<AppRouter>().routeInfoProvider(),
                    routerDelegate: GetIt.I.get<AppRouter>().delegate(),
                  ),
                  orElse: () => const SplashPage(),
                ),
              ),
            ),
          ),
          theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
              background: state.colorTheme.background,
              brightness: state.colorTheme.brightness,
              error: state.colorTheme.error,
              onError: state.colorTheme.onError,
              onPrimary: state.colorTheme.onPrimary,
              primary: state.colorTheme.primary,
            ),
            iconTheme: IconThemeData(color: state.colorTheme.primary),
            textTheme: TextTheme(
              bodyLarge: state.textTheme.body1Regular,
              displayLarge: state.textTheme.headline1,
              displayMedium: state.textTheme.headline2,
              labelLarge: state.textTheme.button,
            ),
            fontFamily: state.textTheme.fontFamily,
          ),
        ),
      ),
    );
  }
}
