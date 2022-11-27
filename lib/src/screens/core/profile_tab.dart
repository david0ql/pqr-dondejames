// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../secure/secure_storage.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Cerrar sesion"),
        onPressed: () async {
          await SecureStorage.delete("correo");
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }
}
