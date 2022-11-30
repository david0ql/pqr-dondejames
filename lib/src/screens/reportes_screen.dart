import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/models/reportes_response.dart';
import 'package:pqr_sistema/src/theme/theme.dart';
import 'package:pqr_sistema/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  late List<Reporte> reportes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      appBar: AppBar(
        title: const Text("reportes"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await obtenerReportes();
          setState(() {});
        },
        child: FutureBuilder(
          future: obtenerReportes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: reportes.length,
              itemBuilder: (BuildContext context, int index) {
                final Reporte customReport = reportes[index];
                return CustomCardReportes(
                  reporte: customReport,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<int> obtenerReportes() async {
    reportes.clear();
    final httpReponse =
        await http.get(Uri.parse("http://127.0.0.1:3000/queja"));
    final reportesReponse = jsonDecode(httpReponse.body);
    for (var element in reportesReponse) {
      reportes.add(Reporte.fromMap(element));
    }
    return 1;
  }
}
