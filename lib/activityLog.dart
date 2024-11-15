import 'package:flutter/material.dart';

class ActivityLogScreen extends StatefulWidget {
  @override
  _ActivityLogScreenState createState() => _ActivityLogScreenState();
}

class _ActivityLogScreenState extends State<ActivityLogScreen> {
  final List<Map<String, dynamic>> activities = [
    {'name': 'Caminata', 'duration': 30, 'completed': true},
    {'name': 'Ejercicio en Casa', 'duration': 45, 'completed': false},
    {'name': 'Ciclismo', 'duration': 60, 'completed': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Actividad Diaria'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gráfico de Progreso Diario
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Progreso Diario',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/progreso_diario.png', height: 300), // Imagen de ejemplo
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Lista de Actividades
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return ListTile(
                    leading: Icon(
                      activity['completed'] ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: activity['completed'] ? Colors.green : Colors.grey,
                    ),
                    title: Text(activity['name']),
                    subtitle: Text('Duración: ${activity['duration']} min'),
                    onTap: () {
                      setState(() {
                        activity['completed'] = !activity['completed'];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para añadir nueva actividad
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
