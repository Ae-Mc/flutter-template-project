import 'package:auto_route/auto_route.dart';
import 'package:flutter_template_project/features/counter/presentation/pages/counter_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CounterRoute.page,
          initial: true,
        )
      ];
}
