import 'package:auto_route/auto_route.dart';
import 'package:todo_app/config/router.gr.dart';
import 'package:todo_app/config/di.dart';
import 'package:injectable/injectable.dart';
// import 'package:todo_app/pages/auth/create_page.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: SplashRoute.page,
        path: '/',
        initial: true,
      ),
      AutoRoute(
        path: '/login',
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
      AutoRoute(
        page: CreateOrUpdateTodoRoute.page,
        path: '/create',
      ),
    ];
  }
}

AppRouter get router => di();
