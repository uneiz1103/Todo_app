import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_app/config/router.gr.dart';
import 'package:todo_app/widgets/unfocus.dart';
import 'package:todo_app/pages/auth/forms/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // TODO: implement build
    final hidePassword = useState(true);

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
        ),
        const SizedBox(height: 20),
        OverflowBar(
          children: [
            TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const RegisterRoute());
              },
              child: const Text('Don\'t have an account? Register'),
            ),
            const SizedBox(width: 23),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ],
        ),
      ],
    );
  }
}
