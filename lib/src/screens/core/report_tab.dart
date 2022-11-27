// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  TextEditingController textEditingControllerPersona = TextEditingController();
  TextEditingController textEditingControllerGrado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            icon: const Icon(Icons.schedule),
            label: 'Descripcion problema',
            textEditingController: textEditingControllerGrado,
          ),
          CustomTextFormField(
            icon: const Icon(Icons.person),
            label: 'Nombre persona',
            textEditingController: textEditingControllerPersona,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final httpResponse = await http.post(Uri.parse(
                    "http://127.0.0.1:3000/queja?descripcion=${textEditingControllerPersona.text}&nombre_alumno=${textEditingControllerGrado.text}"));
                final jsonData = jsonDecode(httpResponse.body);
                if (jsonData["affectedRows"] == 1) {
                  textEditingControllerGrado.text = "";
                  textEditingControllerPersona.text = "";
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reporte creado')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Problema con el reporte')));
                }
              },
              child: const Text("Reportar"),
            ),
          )
        ],
      ),
    );
  }
}
