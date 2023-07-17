import 'package:auto_route/auto_route.dart';
import 'package:flutter_template_project/app/router/app_router.dart';

class ExampleGuard implements AutoRouteGuard {
  final bool Function() isAuthorized;

  ExampleGuard(this.isAuthorized);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthorized()) {
      // ignore: avoid-ignoring-return-values
      router.push(const CounterRoute());
    } else {
      resolver.next();
    }
  }
}
