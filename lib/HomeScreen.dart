import 'package:flutter/material.dart';
import 'userConfiguration.dart';
import 'notifications.dart';
import 'activityLog.dart';
import 'userComparison.dart';
import 'health.dart';
import 'achievements.dart';
import 'cuestionary.dart';
import 'dailySummary.dart'; // Import de Resumen Diario
import 'configuration.dart'; // Import de Configuración
import 'helpAndSupport.dart'; // Import de Ayuda y Soporte

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Hola! usuario'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserConfiguration()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      // Drawer añadido
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: const Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Cuestionario'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cuestionary()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Resumen Diario'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailySummaryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ayuda y Soporte'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpAndSupportScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cuadro de Logros
            _buildMenuOption(
              context,
              'Logros',
              Icons.star,
              Colors.orange,
                  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AchievementsScreen()),
              ),
            ),
            // Cuadro de Registro de Actividad Diaria
            _buildMenuOption(
              context,
              'Registro de Actividad diaria',
              Icons.fitness_center,
              Colors.blue,
                  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityLogScreen()),
              ),
            ),
            // Cuadro de Comparación con Otros Usuarios
            _buildMenuOption(
              context,
              'Comparación con otros usuarios',
              Icons.people,
              Colors.purple,
                  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserComparisonScreen()),
              ),
            ),
            // Cuadro de Objetivo de Salud
            _buildMenuOption(
              context,
              'Objetivo de Salud',
              Icons.health_and_safety,
              Colors.green,
                  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthScreen()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notifications()),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.notifications),
      ),
    );
  }

  Widget _buildMenuOption(
      BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: color, size: 30),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
