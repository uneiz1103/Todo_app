import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/config/di.dart';
import 'package:todo_app/config/providers.dart';
import 'package:todo_app/config/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:todo_app/state/todo_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: providers,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
