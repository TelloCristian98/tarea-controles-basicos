import 'package:flutter/material.dart';
import 'package:tarea_controles_basicos/Layouts/VariableScreen.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController saldoAnteriorController = TextEditingController();
  final TextEditingController montoComprasController = TextEditingController();
  final TextEditingController pagoAnteriorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Bandido de Peluche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: saldoAnteriorController,
              decoration: InputDecoration(labelText: 'Saldo Anterior'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: montoComprasController,
              decoration: InputDecoration(labelText: 'Monto de Compras'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: pagoAnteriorController,
              decoration: InputDecoration(labelText: 'Pago Anterior'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double saldoAnterior = double.parse(saldoAnteriorController.text);
                double montoCompras = double.parse(montoComprasController.text);
                double pagoAnterior = double.parse(pagoAnteriorController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VariablesScreen(
                      saldoAnterior: saldoAnterior,
                      montoCompras: montoCompras,
                      pagoAnterior: pagoAnterior,
                    ),
                  ),
                );
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
