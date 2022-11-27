// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/secure/secure_storage.dart';
import 'package:pqr_sistema/src/theme/theme.dart';
import 'package:pqr_sistema/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _TitleLogin(),
                CustomTextFormField(
                  icon: const Icon(Icons.login),
                  label: 'Correo',
                  textEditingController: textEditingControllerEmail,
                ),
                CustomTextFormField(
                  icon: const Icon(Icons.password),
                  label: 'Clave',
                  textEditingController: textEditingControllerPwd,
                  obscure: true,
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    final httpResponse = await http.get(Uri.parse(
                        "http://127.0.0.1:3000/alumno?correo=${textEditingControllerEmail.text}&clave=${textEditingControllerPwd.text}"));
                    final jsonData = jsonDecode(httpResponse.body);

                    if (jsonData.length > 0) {
                      await SecureStorage.write(
                          'correo', jsonData[0]["correo"]);
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      print("no tiene cuenta");
                    }
                  },
                  text: 'Iniciar sesion',
                ),
                //const _BottomMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomMenu extends StatefulWidget {
  const _BottomMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<_BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<_BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿No tienes cuenta? ",
              style: TextStyle(
                color: MyTheme.primaryColor,
              ),
            ),
            InkWell(
              onTap: () {
                if (!mounted) return;
                Navigator.pushNamed(context, 'register');
              },
              child: Text(
                "Create una",
                style: TextStyle(
                  color: MyTheme.secondColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleLogin extends StatelessWidget {
  const _TitleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "Reportar",
          style: TextStyle(
            color: MyTheme.primaryColor,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
