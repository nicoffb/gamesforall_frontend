import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/locator.dart';
import '../blocs/blocs.dart';
import '../services/services.dart';
import '../style/theme.dart' as Style;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Bienvenido de vuelta',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce un correo electrónico';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce una contraseña';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('¿Has olvidado tu contraseña?'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Regístrate'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No tienes cuenta?'),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {},
                    child: Text('Regístrate'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
