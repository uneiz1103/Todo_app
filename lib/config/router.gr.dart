// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:todo_app/pages/auth/create_page.dart' as _i1;
import 'package:todo_app/pages/auth/login_page.dart' as _i3;
import 'package:todo_app/pages/auth/register_page.dart' as _i4;
import 'package:todo_app/pages/home_page.dart' as _i2;
import 'package:todo_app/pages/splash_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CreateOrUpdateTodoRoute.name: (routeData) {
      final args = routeData.argsAs<CreateOrUpdateTodoRouteArgs>(
          orElse: () => const CreateOrUpdateTodoRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CreateOrUpdateTodoPage(
          key: args.key,
          initialValue: args.initialValue,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateOrUpdateTodoPage]
class CreateOrUpdateTodoRoute
    extends _i6.PageRouteInfo<CreateOrUpdateTodoRouteArgs> {
  CreateOrUpdateTodoRoute({
    _i7.Key? key,
    String? initialValue,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CreateOrUpdateTodoRoute.name,
          args: CreateOrUpdateTodoRouteArgs(
            key: key,
            initialValue: initialValue,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateOrUpdateTodoRoute';

  static const _i6.PageInfo<CreateOrUpdateTodoRouteArgs> page =
      _i6.PageInfo<CreateOrUpdateTodoRouteArgs>(name);
}

class CreateOrUpdateTodoRouteArgs {
  const CreateOrUpdateTodoRouteArgs({
    this.key,
    this.initialValue,
  });

  final _i7.Key? key;

  final String? initialValue;

  @override
  String toString() {
    return 'CreateOrUpdateTodoRouteArgs{key: $key, initialValue: $initialValue}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
