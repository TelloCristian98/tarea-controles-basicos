import 'package:flutter/material.dart';

class ExerciseTwoPage extends StatefulWidget {
  @override
  _ExerciseTwoPageState createState() => _ExerciseTwoPageState();
}

class _ExerciseTwoPageState extends State<ExerciseTwoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreControlador = TextEditingController();
  final TextEditingController _horasControlador = TextEditingController();
  final TextEditingController _tasaControlador = TextEditingController();

  String _resultado = '';

  void _calculateSalary() {
    if (_formKey.currentState!.validate()) {
      String nombre = _nombreControlador.text;
      double horas = double.parse(_horasControlador.text);
      double tasa = double.parse(_tasaControlador.text);

      double salarioSemanal = horas * tasa;
      double descuento;

      if (salarioSemanal <= 150) {
        descuento = salarioSemanal * 0.05;
      } else if (salarioSemanal <= 300) {
        descuento = salarioSemanal * 0.07;
      } else if (salarioSemanal <= 450) {
        descuento = salarioSemanal * 0.09;
      } else {
        descuento = 0;
      }

      double salarioFinal = salarioSemanal - descuento;

      setState(() {
        _resultado = 'Nombre: $nombre\n'
                  'Sueldo Semanal: \$${salarioSemanal.toStringAsFixed(2)}\n'
                  'Descuento: \$${descuento.toStringAsFixed(2)}\n'
                  'Sueldo Final: \$${salarioFinal.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULO DE SUELDO"),
         backgroundColor: Colors.green,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Container(
                width: 700, // Ajusta esta altura según sea necesario
                child: TextFormField(
                  controller: _nombreControlador,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del trabajador',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                ),
              ),


              SizedBox(height: 20),

              Container(
                width: 700,
                child: TextFormField (
                  controller: _horasControlador,
                  decoration: const InputDecoration(
                    labelText: 'Horas trabajadas',
                    labelStyle: TextStyle(
                        fontSize: 18, 
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )    
                    ),

                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese las horas trabajadas';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingrese un número válido';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: 700,
                child: TextFormField(
                  controller: _tasaControlador,
                  decoration: const InputDecoration(
                    labelText: 'Sueldo por hora',
                    labelStyle: TextStyle(
                        fontSize: 18, 
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )    
                    ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el sueldo por hora';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingrese un número válido';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _calculateSalary,
                child: const Text('Calcular Sueldo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Container(
                  width: 700,
                  child: Text(
                    _resultado,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: 'CustomFont',
                    ),
                    textAlign: TextAlign.center, // Esto asegura que el texto esté centrado dentro del Container
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
