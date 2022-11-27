import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/routes/routes.dart';
import 'package:pqr_sistema/src/services/bottom_service.dart';
import 'package:pqr_sistema/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomService>(
          create: (context) => BottomService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

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
