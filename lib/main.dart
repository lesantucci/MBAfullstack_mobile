import 'package:flutter/material.dart';
import 'package:mba_ecommerce/pages/login.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(), // SignUpPage
    );
  }
}
