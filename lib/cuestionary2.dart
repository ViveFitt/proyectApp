import 'package:fastlearners_frontend_flutter/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Importamos la pantalla de inicio

class Cuestionary2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo en la parte superior
                Image.asset(
                  'assets/logo1.png',
                  height: 100,
                ),
                SizedBox(height: 20),
                // Lista de preguntas
                _buildTextField('¿Qué edad tienes?'),
                SizedBox(height: 10),
                _buildTextField('¿Tienes antecedentes familiares de obesidad?'),
                SizedBox(height: 10),
                _buildTextField('¿Tienes antecedentes de presión arterial alta?'),
                SizedBox(height: 10),
                _buildTextField('¿Cuántos días a la semana realizas actividad física?'),
                SizedBox(height: 10),
                _buildTextField('¿Cuánto tiempo al día pasas sentado/a?'),
                SizedBox(height: 10),
                _buildTextField('¿Cuántas porciones de frutas consumes al día?'),
                SizedBox(height: 10),
                _buildTextField('¿Cuántas porciones de verduras consumes al día?'),
                SizedBox(height: 20),
                // Botón de "Ir al inicio"

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Ir al inicio',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para crear los campos de texto
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.green.shade800,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
