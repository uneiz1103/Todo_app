// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_app/config/di.dart' as _i9;
import 'package:todo_app/config/router.dart' as _i3;
import 'package:todo_app/services/auth_service.dart' as _i7;
import 'package:todo_app/state/auth_cubit.dart' as _i8;
import 'package:todo_app/state/todo_cubit.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalDependencies = _$ExternalDependencies();
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.singleton<_i4.FirebaseAuth>(() => externalDependencies.firebaseAuth);
    gh.singleton<_i5.FirebaseFirestore>(() => externalDependencies.firestore);
    gh.singleton<_i6.TodoCubit>(() => _i6.TodoCubit());
    gh.singleton<_i7.AuthService>(
        () => _i7.AuthService(gh<_i4.FirebaseAuth>()));
    gh.singleton<_i8.AuthCubit>(() => _i8.AuthCubit(
          gh<_i7.AuthService>(),
          gh<_i4.FirebaseAuth>(),
        ));
    return this;
  }
}

class _$ExternalDependencies extends _i9.ExternalDependencies {}
