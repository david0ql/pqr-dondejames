import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pqr_sistema/src/secure/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () async {
      (await SecureStorage.read("correo") != "")
          ? Navigator.pushReplacementNamed(context, 'home')
          : Navigator.pushReplacementNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb9e8ff),
      body: Center(
        child: Lottie.asset("assets/splash.json"),
      ),
    );
  }
}
