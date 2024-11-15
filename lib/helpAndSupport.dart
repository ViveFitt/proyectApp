import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda y Soporte'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green, // Fondo verde
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.help_outline,
                size: 80,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              _buildHelpItem('¿Cómo ajustar la configuración de idioma?'),
              const SizedBox(height: 10),
              _buildHelpItem('¿Cómo cambiar el tema a oscuro o claro?'),
              const SizedBox(height: 10),
              _buildHelpItem('Problemas con la privacidad de datos'),
              const SizedBox(height: 10),
              _buildHelpItem('Contactar con soporte técnico'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Regresar al inicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpItem(String text) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.black),
        title: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
