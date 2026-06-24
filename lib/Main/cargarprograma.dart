import 'package:flutter/material.dart';
import 'package:fnlapp/Main/home.dart';
import 'dart:async';

import 'package:fnlapp/Util/enums.dart'; // Necesario para temporizadores

class CargarProgramaScreen extends StatefulWidget {
  final NivelEstres nivelEstres; // Recibe el nivel de estrés

  const CargarProgramaScreen({super.key, required this.nivelEstres});
  @override
  _CargarProgramaScreenState createState() => _CargarProgramaScreenState();
}

class _CargarProgramaScreenState extends State<CargarProgramaScreen> {
  double _progress = 0;
  String _statusText = 'Personalizando tu experiencia ...';

  @override
  void initState() {
    super.initState();
    print(
        'Nivel de Estrés Recibido en CargarPrograma: ${widget.nivelEstres.name}'); // Aquí verificas que recibes el valor
    _startLoading();
  }

  // Función para iniciar el progreso
  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Cambiado a 1000 milisegundos (1 segundos)
      setState(() {
        _progress += 2; // Incrementa en 1 cada 1 segundo
        if (_progress >= 100) {
          timer
              .cancel(); // Detiene el temporizador cuando el progreso llega al 100%
          setState(() {
            _statusText = 'Programa generado exitosamente 🧠👌🏻';
          });
          _goToHome(); // Redirige a Home después del retraso
        }
      });
    });
  }

  // Función que redirige a la pantalla de inicio después de un retraso
  void _goToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Redirige a la pantalla principal (HomeScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Pasa el nivel de estrés a la pantalla de Home
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Utiliza Stack para centrar el porcentaje dentro del CircularProgressIndicator
            Stack(
              alignment: Alignment
                  .center, // Centra todos los elementos dentro del Stack
              children: [
                // CircularProgressIndicator
                SizedBox(
                  height: 320, // Ajusta el tamaño general
                  width: 320,
                  child: CircularProgressIndicator(
                    value: _progress / 100, // Progreso de 0 a 1
                    strokeWidth: 15, // Mantén el grosor del círculo
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                ),
                // Texto del porcentaje centrado dentro del círculo
                Text(
                  '${_progress.toInt()}%', // Muestra el porcentaje
                  style: const TextStyle(
                    fontSize: 60, // Tamaño más grande para el porcentaje
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Texto debajo del círculo que cambia al llegar al 100%
            Text(
              _statusText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
