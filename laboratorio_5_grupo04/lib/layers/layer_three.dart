import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba/config.dart';
import 'package:prueba/Menu/menu_screen.dart'; // Importa la clase MenuScreen

class LayerThree extends StatefulWidget {
  @override
  _LayerThreeState createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: Container(
                width: 310,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter User ID or Email',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 229,
              child: Container(
                width: 310,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
              right: 60,
              top: 296,
              child: Text(
                'Forgot Password',
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
          Positioned(
              left: 87,
              top: 375,
              child: Text(
                'Remember Me',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 365,
              right: 60,
              child: Container(
                width: 99,
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ElevatedButton(
                    onPressed: () {
                      String enteredUsername = usernameController.text;
                      String enteredPassword = passwordController.text;

                      if (enteredUsername == 'admin' &&
                          enteredPassword == 'admin') {
                        // Navegar a la pantalla MenuScreen
                        Navigator.pushReplacementNamed(context, '/menu');
                      } else {
                        // Credenciales incorrectas, aquí puedes mostrar un mensaje de error
                      }
                    },
                    child: Text(
                      'Sign In',
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/icon_google.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                  Text(
                    'or',
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/icon_apple.png',
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
}