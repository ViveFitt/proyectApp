import 'package:flutter/material.dart';

class AchievementsScreen extends StatefulWidget {
  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  // Datos para los logros
  final List<Map<String, dynamic>> achievements = [
    {
      'image': 'assets/logro1.png',
      'title': 'Medalla 1',
      'description': 'Completa 10 actividades diarias para desbloquear esta medalla.',
      'objectives': [
        'Realiza 3 actividades físicas',
        'Completa 2 cuestionarios de salud',
        'Registra tu peso 5 veces',
      ],
      'unlocked': true, // La primera medalla está desbloqueada
    },
    {
      'image': 'assets/logro2.png',
      'title': 'Medalla 2',
      'description': 'Alcanza el objetivo de salud semanal para obtener esta medalla.',
      'objectives': [
        'Registra tu actividad durante 7 días seguidos',
        'Alcanza al menos 10,000 pasos diarios',
        'Bebe 2 litros de agua diarios durante una semana',
      ],
      'unlocked': false,
    },
    {
      'image': 'assets/logro3.png',
      'title': 'Medalla 3',
      'description': 'Cumple tus metas de ejercicio durante un mes.',
      'objectives': [
        'Corre al menos 5 km cada semana',
        'Realiza 20 minutos de ejercicio diario',
        'Participa en 4 eventos de actividad física',
      ],
      'unlocked': false,
    },
    {
      'image': 'assets/logro4.png',
      'title': 'Medalla 4',
      'description': 'Logra todos los objetivos anteriores para desbloquear esta medalla final.',
      'objectives': [
        'Completa los objetivos de la Medalla 1, 2 y 3',
        'Mantén un registro de tu progreso cada día',
        'Comparte tu logro en redes sociales',
      ],
      'unlocked': false,
    },
  ];

  // Función para mostrar los detalles de cada logro
  void _showAchievementDetails(BuildContext context, Map<String, dynamic> achievement) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [
              Icon(Icons.emoji_events, color: Colors.orange),
              const SizedBox(width: 10),
              Text(achievement['title']),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(achievement['image'], height: 150),
              const SizedBox(height: 10),
              Text(
                achievement['description'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text('Objetivos para desbloquear:'),
              ...achievement['objectives'].map<Widget>((objective) {
                return ListTile(
                  leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                  title: Text(objective),
                );
              }).toList(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logros'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          final isUnlocked = achievement['unlocked'];

          return GestureDetector(
            onTap: isUnlocked
                ? () => _showAchievementDetails(context, achievement)
                : () {}, // No muestra detalles si está bloqueado
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Imagen de la medalla con filtro de opacidad si está bloqueada
                  Center(
                    child: ColorFiltered(
                      colorFilter: isUnlocked
                          ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                          : const ColorFilter.mode(Colors.black54, BlendMode.saturation),
                      child: Image.asset(
                        achievement['image'],
                        height: 140,
                      ),
                    ),
                  ),
                  // Superposición semitransparente para las medallas bloqueadas
                  if (!isUnlocked)
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  // Icono de candado si está bloqueado
                  if (!isUnlocked)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                        size: 28,
                      ),
                    ),
                  // Título de la medalla
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        achievement['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isUnlocked ? Colors.black : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
