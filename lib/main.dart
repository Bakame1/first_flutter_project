import 'package:first_flutter_project/core/secrets/app_secrets.dart';
import 'package:first_flutter_project/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();//Ensures that all the bindings are initialized before running the app
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(const MyApp());
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

