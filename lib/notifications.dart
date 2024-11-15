import 'package:flutter/material.dart';
import 'homeScreen.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green, // Fondo verde
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Tus Notificaciones',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotificationCard(
                      '¡Hora de hidratarse!',
                      'No olvides beber un vaso de agua.',
                      Icons.local_drink,
                    ),
                    _buildNotificationCard(
                      'Gran trabajo',
                      'Llevas un 75% de tu meta diaria de pasos.',
                      Icons.directions_walk,
                    ),
                    _buildNotificationCard(
                      'Recuerda comer sano',
                      'Comer vegetales en tus comidas ayuda a mantener la salud.',
                      Icons.local_dining,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget personalizado para las tarjetas de notificación con sombra
  Widget _buildNotificationCard(String title, String description, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red.shade100,
            child: Icon(icon, color: Colors.red),
            radius: 25,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
          onTap: () {
            // Acción al tocar la notificación (si es necesario)
          },
        ),
      ),
    );
  }
}
