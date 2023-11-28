import 'package:flutter/material.dart';
import './login.dart' as login;
import './style.dart' as style;

void main() {
  runApp(
      MaterialApp(
          //theme: style.theme,
          home: login.loginPage()
        //MyApp()
      )
  );
}
