import 'package:flutter/material.dart';
import 'package:proyecto_sm/view/reservar_view.dart';
import 'package:proyecto_sm/model/reservar_model.dart';
import 'package:proyecto_sm/view/misPredicciones_view.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ReservarViewModel {

  String predValue = "Cargando...";
  late Interpreter interpreter;

  ReservarViewModel() {
    _loadModelAndRunInference();
  }

  Future<void> _loadModelAndRunInference() async {
    interpreter = await Interpreter.fromAsset('assets/Modelo.tflite');
    final output = List.filled(1 * 1, 0.0).reshape([1, 1]);
    interpreter.run([96], output);
    final parsedValue = double.parse(output[0][0].toString());
    predValue = parsedValue.round().toString();
  }

  getReservas() {}
/*
  Future<List<Reserva>> getReservas() async {
    // Aquí puedes cargar y devolver la lista de reservas desde algún origen de datos.
    // Por ejemplo, puedes cargar los datos desde una API o una base de datos.
    // Retorna una lista de objetos Reserva.
  }
  */
}