import 'package:dashboard_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Environment.initEnvirontment();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dashboard App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkmode: false).getTheme(),
      routerConfig: appRouter,
    );
  }
}
