import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:luthor/luthor.dart';
import 'package:todo_app/common/data_state.dart';
import 'package:todo_app/config/router.dart';
import 'package:todo_app/config/router.gr.dart';
import 'package:todo_app/state/auth_cubit.dart';
import 'package:todo_app/widgets/unfocus.dart';
import 'package:todo_app/pages/auth/forms/auth_form.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthForm(),
      child: const Unfocus(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: _Body(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final hidePassword = useState(true);

    final isLoading = context.select(
      (AuthCubit c) => c.state.loginState is DataStateLoading,
    );

    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Text(
            'Login into your acccount',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: context.select((AuthForm form) => form.emailError),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) => context.read<AuthForm>().changeEmail(value),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: context.select((AuthForm form) => form.passwordError),
            suffixIcon: IconButton(
              onPressed: () => hidePassword.value = !hidePassword.value,
              icon: Icon(
                hidePassword.value ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: hidePassword.value,
          onChanged: (value) => context.read<AuthForm>().changePassword(value),
          onFieldSubmitted: (_) => _login(context),
        ),
        const SizedBox(height: 20),
        OverflowBar(
          children: [
            TextButton(
              onPressed: () async {
                router.push(const RegisterRoute());
              },
              child: const Text('Don\'t have an account? Register'),
            ),
            const SizedBox(width: 23),
            ElevatedButton(
              onPressed: isLoading ? null : () => _login(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _login(BuildContext context) async {
    final validationResult = context.read<AuthForm>().validate();
    if (validationResult is! SchemaValidationSuccess) return;

    final body = validationResult.data!;
    final loginResult = await context.read<AuthCubit>().login(body);
    if (!context.mounted) return;
    switch (loginResult) {
      case DataStateSuccess():
        router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      case DataStateFailure(failure: final f):
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(f.messageOrDefault)));
      case _:
        break;
    }
  }
}
