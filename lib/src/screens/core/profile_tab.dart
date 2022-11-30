// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/theme/theme.dart';

import '../../secure/secure_storage.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late String _nombre = "";
  late String _correo = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: obtenerDatos(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                      color: MyTheme.primaryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nombre: $_nombre",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Correo: $_correo",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Cerrar sesion"),
            onPressed: () async {
              await SecureStorage.delete("correo");
              await SecureStorage.delete("nombre");
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }

  Future<int> obtenerDatos() async {
    final nombre = await SecureStorage.read("nombre");
    final correo = await SecureStorage.read("correo");
    _nombre = nombre;
    _correo = correo;
    return 1;
  }
}
