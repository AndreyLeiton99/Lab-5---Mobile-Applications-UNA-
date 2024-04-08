import 'package:flutter/material.dart';
import 'package:prueba/config.dart'; // Importa la clase MenuScreen

class LayerThree extends StatefulWidget {
  const LayerThree({super.key});

  @override
  _LayerThreeState createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Usuario',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: SizedBox(
                width: 310,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Ingrese usuario o correo electrónico',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Contraseña',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 229,
              child: SizedBox(
                width: 310,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Ingrese su contraseña',
                    hintStyle: TextStyle(color: hintText),
                  ),
                  onSubmitted: (value) {
                    String enteredUsername = usernameController.text;
                    String enteredPassword = passwordController.text;

                    _checkCredentials(
                        enteredUsername, enteredPassword, context);
                  },
                ),
              )),
          const Positioned(
              right: 60,
              top: 296,
              child: Text(
                '¿Olvidó su contraseña?',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              left: 46,
              top: 361,
              child: Checkbox(
                checkColor: Colors.black,
                activeColor: checkbox,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              )),
          const Positioned(
              left: 87,
              top: 375,
              child: Text(
                'Recuérdame',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 365,
              right: 60,
              child: SizedBox(
                width: 99,
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ElevatedButton(
                    onPressed: () {
                      String enteredUsername = usernameController.text;
                      String enteredPassword = passwordController.text;

                      _checkCredentials(
                          enteredUsername, enteredPassword, context);
                    },
                    child: const Text(
                      'Entrar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF024335),
                          fontSize: 14,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 432,
              left: 59,
              child: Container(
                height: 0.5,
                width: 310,
                color: inputBorder,
              )),
          Positioned(
              top: 482,
              left: 120,
              right: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/login/icon_google.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                  const Text(
                    'ó',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: hintText),
                  ),
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/login/icon_apple.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void showLoginErrorAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        showCloseIcon: true,
        padding: const EdgeInsets.all(25),
        content: const Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                'Credenciales incorrectas. Inténtalo de nuevo.\n(Pista para el profe: Pruebe con admin/admin)',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _checkCredentials(
      String enteredUsername, String enteredPassword, BuildContext context) {
    if (enteredUsername == 'admin' && enteredPassword == 'admin') {
      // Navegar a la pantalla MenuScreen
      Navigator.pushReplacementNamed(context, '/menu');
    } else {
      // Credenciales incorrectas, mostrar mensaje de error
      showLoginErrorAlert(context);
      usernameController.clear();
      passwordController.clear();
    }
  }
}
