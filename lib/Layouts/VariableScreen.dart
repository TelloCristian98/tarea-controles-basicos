import 'package:flutter/material.dart';

class VariablesScreen extends StatelessWidget {
  final double saldoAnterior;
  final double montoCompras;
  final double pagoAnterior;

  VariablesScreen({
    required this.saldoAnterior,
    required this.montoCompras,
    required this.pagoAnterior,
  });

  @override
  Widget build(BuildContext context) {
    double saldoActual = saldoAnterior + montoCompras - pagoAnterior;
    double pagoMinimo = saldoActual * 0.15;
    double pagoSinIntereses = saldoActual * 0.85;
    double intereses = saldoActual * 0.12 + 200;
    double saldoConIntereses = saldoActual + intereses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
        backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
    body: Container(
        color: Colors.lightBlue[100], // Fondo de color celeste
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 167, 230),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Saldo Anterior: \$${saldoAnterior.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Monto de Compras: \$${montoCompras.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Pago Anterior: \$${pagoAnterior.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(height: 20),
                  Text('Saldo Actual: \$${saldoActual.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Pago Mínimo: \$${pagoMinimo.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Pago para no Generar Intereses: \$${pagoSinIntereses.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(height: 20),
                  Text('Intereses y Multas por No Pago Mínimo: \$${intereses.toStringAsFixed(2)}', 
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Saldo Actual con Intereses: \$${saldoConIntereses.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}