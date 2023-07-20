import 'package:calculadora_imc/components/home.dart';
import 'package:flutter/material.dart';

class AppWdidget extends StatefulWidget {
  const AppWdidget({super.key});

  @override
  State<AppWdidget> createState() => _AppWidget();
}

class _AppWidget extends State<AppWdidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 218, 164, 16),
      ),
      body: Home(),
    );
  }
}