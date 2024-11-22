import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/password_reset.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/password_reset': (context) => PasswordResetScreen(),
      },
    );
  }
}
