import 'package:flutter/material.dart';

// ! Configurar el provider en el pubspec.yaml, igusl que como los assets

class LoginProvider extends ChangeNotifier {
  String username = "";
  String password = "";

  void change(enteredUsername, enteredPassword){
    username = enteredUsername;
    password = enteredPassword;
    notifyListeners();
  }
}
