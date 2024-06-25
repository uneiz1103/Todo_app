import 'package:auto_route/auto_route.dart';
import 'package:todo_app/config/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        path: '/login',
        page: LoginRoute.page,
      ),
      AutoRoute(
        path: '/register',
        page: RegisterRoute.page,
      ),
    ];
  }
}
