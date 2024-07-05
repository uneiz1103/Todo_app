// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:todo_app/config/di.dart';
import 'package:todo_app/config/router.dart';
import 'package:todo_app/config/router.gr.dart';
import 'package:todo_app/state/todo_cubit.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:todo_app/state/auth_cubit.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            onPressed: () => _addTodo(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final shouldLogout = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            },
          ).then((value) => value ?? false);
          if (!context.mounted || !shouldLogout) return;

          await context.read<AuthCubit>().logout();
          router.pushAndPopUntil(
            const LoginRoute(),
            predicate: (route) => false,
          );
        },
        child: const Icon(Icons.logout),
      ),
      body: const TodoList(),
    );
  }

  // void _addTodo(BuildContext context) async {
  //   final String? text =
  //       await Navigator.of(context).pushNamed('/create_or_update') as String?;
  //   if (!context.mounted || text == null) return;
  //   context.read<TodoCubit>().add(text);
  // }

  void _addTodo(BuildContext context) async {
    final String? text =
        await AutoRouter.of(context).push(CreateOrUpdateTodoRoute()) as String?;
    if (!context.mounted || text == null) return;
    context.read<TodoCubit>().add(text);
  }
}
