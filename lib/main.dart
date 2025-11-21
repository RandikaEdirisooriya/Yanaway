import 'package:flutter/material.dart';
import 'package:yanaway/routes/app_routes.dart';
import 'package:yanaway/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YanaWay',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.getRoutes(),
    );
  }
}
