import 'package:auto_route/auto_route.dart';
import 'package:todo_app/config/router.gr.dart';
import 'package:todo_app/config/di.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        path: '/',
        page: LoginRoute.page,
      ),
      AutoRoute(
        path: '/register',
        page: RegisterRoute.page,
      ),
      AutoRoute(
        path: '/home',
        page: HomeRoute.page,
      ),
    ];
  }
}

AppRouter get router => di();
