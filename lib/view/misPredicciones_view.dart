import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_sm/viewmodel/misPredicciones_view_model.dart';

class PrediccionWidget extends StatefulWidget {
  //const PrediccionWidget({Key? key, required this.viewModel}) : super(key: key);
  final misPrediccionViewModel viewModel;

  PrediccionWidget({required this.viewModel});

  @override
  _PrediccionWidgetState createState() => _PrediccionWidgetState();
}

class _PrediccionWidgetState extends State<PrediccionWidget> {
  List<double> data = [30.0, 15.0, 20.0, 30.0, 25.0, 30.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicciones'),
        backgroundColor: const Color(0xFF4B39EF),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            prediccion(context),
            prediccionReservas(widget.viewModel.predValue),
          ],
        ),
      ),
    );
  }

  Widget prediccion(context){

    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Predicción de Reservas de Salones',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ReadexPro',
                fontSize: 20,
                color: Colors.black, // Set your text color here
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                'Estimado diario',
                style: TextStyle(
                  fontFamily: 'ReadexPro',
                  color: Colors.black, // Set your text color here
                ),
              ),
            ),

           // prediccionReservas(widget.viewModel.predValue),


            // Aca va el codigo del grafico
            Container(
              height: 300, // Define the height of the chart
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF37434D),
                        width: 1,
                      ),
                      left: BorderSide(
                        color: const Color(0xFF37434D),
                        width: 1,
                      ),
                      right: BorderSide(
                        color: const Color(0xFF37434D),
                        width: 1,
                      ),
                      top: BorderSide(
                        color: const Color(0xFF37434D),
                        width: 1,
                      ),
                    ),
                  ),
                  minX: 0, // Minimum x-axis value
                  maxX: data.length.toDouble() - 1, // Maximum x-axis value
                  minY: 0, // Minimum y-axis value
                  maxY: 50, // Maximum y-axis value (you can adjust this)
                  lineBarsData: [
                    LineChartBarData(
                      spots: data.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value);
                      }).toList(),
                      isCurved: true,
                      colors: [Colors.blue], // Line color
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }


  Widget prediccionReservas(var predValue) {
    //misPrediccionViewModel viewModel = misPrediccionViewModel();
    return Padding(

      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
      child: Text(
        "Reservas estimadas para hoy: $predValue",
        style: TextStyle(fontSize: 16, fontFamily: 'ReadexPro', color: Colors.black),
      ),
    );
  }
}
