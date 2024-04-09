import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/layers/layer_one.dart';
import 'package:prueba/layers/layer_three.dart';
import 'package:prueba/layers/layer_two.dart';
import 'package:prueba/Menu/menu_screen.dart';
import 'package:prueba/providers/login_providers.dart';

//! Proyecto creado por Bryan Retana Chacón y Andrey Leitón Gutiérrez

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create:(_) => LoginProvider())],
    child: MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Ruta inicial de la aplicación
      routes: {
        '/login': (context) =>
            const LoginPage(), // Ruta de la pantalla de inicio de sesión
        '/menu': (context) => const MenuScreen(), // Ruta de la pantalla de menú
      },
    ),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/login/primaryBg.png'),
          fit: BoxFit.cover,
        )),
        child: const Stack(
          children: <Widget>[
            Positioned(
                top: 136,
                left: 59,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow),
                )),
            Positioned(top: 200, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 218, right: 0, bottom: 0, child: LayerTwo()),
            Positioned(top: 170, right: 0, bottom: 0, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
