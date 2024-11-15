import 'package:flutter/material.dart';

class UserComparisonScreen extends StatefulWidget {
  @override
  _UserComparisonScreenState createState() => _UserComparisonScreenState();
}

class _UserComparisonScreenState extends State<UserComparisonScreen> {
  // Datos de ejemplo para comparación
  final List<Map<String, dynamic>> comparisonData = [
    {'metric': 'Pasos Diarios', 'user': 8000, 'average': 7000},
    {'metric': 'Calorías Quemadas', 'user': 500, 'average': 450},
    {'metric': 'Minutos de Ejercicio', 'user': 60, 'average': 45},
  ];

  // Métricas disponibles para comparar
  String selectedMetric = 'Pasos Diarios';

  // Filtrar datos según la métrica seleccionada
  Map<String, dynamic> getSelectedData() {
    return comparisonData.firstWhere((data) => data['metric'] == selectedMetric);
  }

  @override
  Widget build(BuildContext context) {
    final selectedData = getSelectedData();
    final userValue = selectedData['user'];
    final averageValue = selectedData['average'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparación con Otros Usuarios'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar y nombre del usuario
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar_user.png'), // Imagen del usuario
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tú',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar_average.png'), // Imagen del grupo promedio
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Promedio',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Selección de métrica
            DropdownButton<String>(
              value: selectedMetric,
              items: comparisonData.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem<String>(
                  value: data['metric'],
                  child: Text(data['metric']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMetric = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            // Indicador de progreso comparativo
            Text(
              '$selectedMetric',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('Tú'),
                      Stack(
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                          Container(
                            height: 20,
                            width: (userValue / (userValue + averageValue)) * MediaQuery.of(context).size.width,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text('$userValue', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Promedio'),
                      Stack(
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                          Container(
                            height: 20,
                            width: (averageValue / (userValue + averageValue)) * MediaQuery.of(context).size.width,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text('$averageValue', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Gráfico de barras comparativo
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
                    'Gráfico Comparativo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/ejercicio.png', height: 250),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
