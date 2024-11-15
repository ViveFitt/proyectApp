import 'package:flutter/material.dart';
import 'cuestionary2.dart'; // Importamos la siguiente pantalla del cuestionario

class Cuestionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo en la parte superior
              Image.asset(
                'assets/logo1.png', // Asegúrate de tener tu logo en assets
                height: 150,
              ),
              SizedBox(height: 30),
              // Texto de explicación
              Text(
                'Antes de continuar con que finalidad de personalizar las recomendaciones debes completar el formulario.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              // Botón de "Continuar"
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navegar a Cuestionary2
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cuestionary2()),
                  );
                },
                child: Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
