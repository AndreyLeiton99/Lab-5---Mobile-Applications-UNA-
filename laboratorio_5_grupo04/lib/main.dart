import 'package:flutter/material.dart';
import 'package:prueba/layers/layer_one.dart';
import 'package:prueba/layers/layer_three.dart';
import 'package:prueba/layers/layer_two.dart';
import 'package:prueba/Menu/menu_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login Demo',
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/login', // Ruta inicial de la aplicación
    routes: {
      '/login': (context) =>
          LoginPage(), // Ruta de la pantalla de inicio de sesión
      '/menu': (context) => MenuScreen(), // Ruta de la pantalla de menú
    },
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/primaryBg.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 250,
                left: 59,
                child: Container(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.yellow),
                  ),
                )),
            Positioned(top: 350, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 368, right: 0, bottom: 15, child: LayerTwo()),
            Positioned(top: 320, right: 0, bottom: 48, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
