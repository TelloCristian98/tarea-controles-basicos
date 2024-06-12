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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saldo Anterior: \$${saldoAnterior.toStringAsFixed(2)}'),
            Text('Monto de Compras: \$${montoCompras.toStringAsFixed(2)}'),
            Text('Pago Anterior: \$${pagoAnterior.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            Text('Saldo Actual: \$${saldoActual.toStringAsFixed(2)}'),
            Text('Pago Mínimo: \$${pagoMinimo.toStringAsFixed(2)}'),
            Text('Pago para no Generar Intereses: \$${pagoSinIntereses.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            Text('Intereses y Multas por No Pago Mínimo: \$${intereses.toStringAsFixed(2)}'),
            Text('Saldo Actual con Intereses: \$${saldoConIntereses.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}