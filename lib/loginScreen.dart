import 'package:fastlearners_frontend_flutter/cuestionary.dart';
import 'package:flutter/material.dart';
import 'registerScreen.dart'; // Importa la pantalla de registro

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo más grande
              Image.asset(
                'assets/logo1.png',
                height: 150, // Aumentamos el tamaño del logo
              ),
              SizedBox(height: 20),
              // Caja con fondo oscuro para los botones
              Container(
                padding: EdgeInsets.all(15), // Ajustamos el tamaño de la caja
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Fondo oscuro para la caja
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Botón "Iniciar Sesión"
                    _buildAnimatedButton(
                      context: context,
                      text: 'Iniciar Sesión',
                      color: Colors.black, // Fondo oscuro para el botón
                      onPressed: () {
                        // Lógica de inicio de sesión aquí
                      },
                    ),
                    SizedBox(width: 10),
                    // Botón "Registrarse"
                    _buildAnimatedButton(
                      context: context,
                      text: 'Registrarse',
                      color: Colors.black, // Fondo oscuro para el botón
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Campos de texto
              _buildAnimatedTextField(hintText: 'Correo electrónico'),
              SizedBox(height: 10),
              _buildAnimatedTextField(
                hintText: 'Contraseña',
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Botón de inicio de sesión con animación
              _buildAnimatedButton(
                context: context,
                text: 'Ingresar',
                color: Colors.black, // Fondo oscuro para el botón
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cuestionary()),
                  );
                },

              ),
              SizedBox(height: 20),
              // Redes sociales
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo_google.png', height: 50),
                  SizedBox(width: 10),
                  Image.asset('assets/logo_facebook.png', height: 50),
                  SizedBox(width: 10),
                  Image.asset('assets/logo_apple.png', height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Botón animado dentro de la caja
  Widget _buildAnimatedButton({
    required BuildContext context,
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: color, // Fondo oscuro para el botón
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Campos de texto con animación
  Widget _buildAnimatedTextField({
    required String hintText,
    bool obscureText = false,
  }) {
    return Focus(
      onFocusChange: (hasFocus) {
        // Puedes agregar efectos aquí si lo deseas
      },
      child: TextField(
        obscureText: obscureText,
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
      ),
    );
  }
}
