import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  double healthProgress = 0.65; // Progreso de salud (65%)
  final List<Map<String, dynamic>> habits = [
    {'habit': 'Beber 2L de agua', 'completed': false},
    {'habit': 'Dormir 8 horas', 'completed': true},
    {'habit': 'Ejercicio diario 30 min', 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetivo de Salud'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Indicador de Progreso de Salud
            Text(
              'Progreso de Salud: ${(healthProgress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Gráfico Circular de Objetivos
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        value: healthProgress,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${(healthProgress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Lista de Hábitos Saludables
            Expanded(
              child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return ListTile(
                    leading: Icon(
                      habit['completed'] ? Icons.check_box : Icons.check_box_outline_blank,
                      color: habit['completed'] ? Colors.green : Colors.grey,
                    ),
                    title: Text(habit['habit']),
                    onTap: () {
                      setState(() {
                        habit['completed'] = !habit['completed'];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
