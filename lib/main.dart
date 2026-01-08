import 'package:first_flutter_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:first_flutter_project/features/auth/presentation/pages/login_page.dart';
import 'package:first_flutter_project/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();//Ensures that all the bindings are initialized before running the app
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => servicesLocator<AuthBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// remove debug banner top right corner
      title: 'Blog Demo',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

