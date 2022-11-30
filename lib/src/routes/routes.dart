import 'package:flutter/material.dart';
import '../screens/screens.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'splash': (p0) => const SplashScreen(),
    'home': (p0) => const HomeScreen(),
    'login': (p0) => const LoginScreen(),
    'register': (p0) => const RegisterScreen(),
    'reportes': (p0) => const ReportesScreen()
  };
}
