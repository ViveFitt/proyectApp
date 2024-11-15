import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class UserConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,  // Esto evitará que el contenido suba cuando el teclado aparece
      body: Container(
        color: Colors.green, // Fondo verde
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto de perfil con sombra más intensa
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54, // Sombra más fuerte
                      blurRadius: 15,        // Aumentamos el desenfoque
                      spreadRadius: 5,       // Expandimos la sombra
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 60, color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Acción para cambiar foto
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Cambiar foto de perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,   // Color del icono y texto
                ),
              ),
              const SizedBox(height: 20),

              // Campos de texto con sombra más intensa
              Expanded(
                child: ListView(
                  children: [
                    _buildTextField('Nombres y Apellidos', Icons.person),
                    const SizedBox(height: 16),
                    _buildTextField('Estatura (m)', Icons.height),
                    const SizedBox(height: 16),
                    _buildTextField('Peso (Kg)', Icons.monitor_weight),
                    const SizedBox(height: 16),
                    _buildTextField('Correo electrónico', Icons.email),
                  ],
                ),
              ),

              // Botón "Guardar Cambios" con sombra más pronunciada
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54, // Sombra más fuerte
                      blurRadius: 15,        // Aumentamos el desenfoque
                      spreadRadius: 5,       // Expandimos la sombra
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Color del botón
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 12, // Sombra del botón
                  ),
                  child: const Text(
                    'Guardar Cambios',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget personalizado para los campos de texto con sombra más intensa
  Widget _buildTextField(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54, // Sombra más fuerte
            blurRadius: 15,        // Aumentamos el desenfoque
            spreadRadius: 5,       // Expandimos la sombra
          ),
        ],
        borderRadius: BorderRadius.circular(10), // Radio de esquina
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
