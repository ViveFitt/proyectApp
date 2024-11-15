import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class DailySummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen Diario'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green, // Fondo verde
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSummaryCard(Icons.directions_run, 'Resumen de pasos, duración de ejercicio, etc.'),
              const SizedBox(height: 10),
              _buildSummaryCard(Icons.water_drop, 'Total de agua consumida y comparación con meta diaria.'),
              const SizedBox(height: 10),
              _buildSummaryCard(Icons.nightlight_round, 'Horas de sueño registradas, comparadas con el objetivo.'),
              const SizedBox(height: 10),
              _buildSummaryCard(Icons.apple, 'Resumen de comidas saludables registradas.'),
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
                child: const Text('Ver Reporte Completo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(IconData icon, String text) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 40, // Aumenta este valor para agrandar el icono
        ),
        title: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        iconColor: Colors.black, // Color del ícono
      ),
    );
  }
}
