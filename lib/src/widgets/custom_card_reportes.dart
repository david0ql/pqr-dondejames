import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/models/reportes_response.dart';

class CustomCardReportes extends StatelessWidget {
  final Reporte reporte;
  const CustomCardReportes({super.key, required this.reporte});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 6,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nombre: ${reporte.descripcion}"),
              Text("Descripcion: ${reporte.nombreAlumno}"),
              Text("Fecha: ${reporte.fechaRegistro.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
