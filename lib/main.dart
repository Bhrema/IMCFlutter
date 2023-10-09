import 'package:flutter/material.dart';
import 'package:imc/pages/calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFFC4F5DF)),
      home: CalculadoraPage(),
    );
  }
}
