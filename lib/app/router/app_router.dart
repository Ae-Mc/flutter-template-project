import 'package:auto_route/auto_route.dart';
import 'package:flutter_template_project/features/splash/presentation/pages/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashPage),
  ],
)
class $AppRouter {}
