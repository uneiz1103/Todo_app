import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config/di.dart';
import 'package:todo_app/state/auth_cubit.dart';

List<BlocProvider> get providers {
  return [
    BlocProvider<AuthCubit>(create: (context) => di()),
  ];
}
