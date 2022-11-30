// To parse this JSON data, do
//
//     final reportesResponse = reportesResponseFromMap(jsonString);

import 'dart:convert';

class Reporte {
  Reporte({
    required this.idQueja,
    required this.descripcion,
    required this.nombreAlumno,
    required this.fechaRegistro,
  });

  int idQueja;
  String descripcion;
  String nombreAlumno;
  DateTime fechaRegistro;

  factory Reporte.fromJson(String str) => Reporte.fromMap(json.decode(str));

  factory Reporte.fromMap(Map<String, dynamic> json) => Reporte(
        idQueja: json["id_queja"],
        descripcion: json["descripcion"],
        nombreAlumno: json["nombre_alumno"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
      );
}
