import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/routes/routes.dart';
import 'package:pqr_sistema/src/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Report',
      initialRoute: 'splash',
      routes: MyRoutes.routes,
      theme: MyTheme.customTheme,
    );
  }
}
