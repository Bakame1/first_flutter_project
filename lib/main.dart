import 'package:first_flutter_project/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme.dart';

void main() {
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

