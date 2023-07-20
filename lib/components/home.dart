import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {  

  GlobalKey<FormState> _formKey = GlobalKey();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String _inforText = 'Informe seus dados.';

  void _reset(){
    pesoController.text = '';
    alturaController.text = '';
   setState(() {
    _inforText = 'Informe seus dados.';
    _formKey = GlobalKey<FormState>();
   });
  }

  void _calcular(){
    setState(() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);
    if (imc < 18.6) {
      _inforText = 'Abaixo do peso (IMC: ${imc.toStringAsPrecision(3)})';
    }else if(imc >= 18.6 && imc < 24.9){
      _inforText = 'Peso Ideal (IMC: ${imc.toStringAsPrecision(3)})';
    }else if(imc >= 24.9 && imc < 29.9){
      _inforText = 'Levemente acima do peso (IMC: ${imc.toStringAsPrecision(3)})';
    }else if(imc >= 29.9 && imc < 34.9){
      _inforText = 'Obesidade Grau I (IMC: ${imc.toStringAsPrecision(3)})';
    }else if(imc >= 34.9 && imc < 39.9){
      _inforText = 'Obesidade Grau II (IMC: ${imc.toStringAsPrecision(3)})';
    }else if(imc > 40){
      _inforText = 'Obesidade Grau III (IMC: ${imc.toStringAsPrecision(3)})';
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.perm_identity_sharp,
          size: 120,
          color: Color.fromARGB(255, 218, 164, 16),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Peso (kg)',
              labelStyle: TextStyle(color: Color.fromARGB(255, 218, 164, 16))),
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 25, color: Color.fromARGB(255, 218, 164, 16)),
          controller: pesoController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Insira seu peso';
            }
          },
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Altura (cm)',
              labelStyle: TextStyle(color: Color.fromARGB(255, 218, 164, 16))),
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 25, color: Color.fromARGB(255, 218, 164, 16)),
              controller: alturaController,
              validator: (value) {
            if (value!.isEmpty) {
              return 'Insira uma altura';
            }
          }
        ),
        const SizedBox(height: 16),
        Container(height: 50,
          child: ElevatedButton(onPressed: (){
            if (_formKey.currentState!.validate()) {
              _calcular();
            }
          }, 
          child: const Text('Calcular', style: TextStyle(fontSize: 25),),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 218, 164, 16),),),
        ),
        const SizedBox(height: 16),
        Text(_inforText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 218, 164, 16)),
        ),
        const SizedBox(height: 50),
        Container(
  child: ElevatedButton.icon(
    onPressed: _reset,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 218, 164, 16),
      fixedSize: Size(60, 50),
    ),
    icon: Icon(Icons.refresh_rounded),
    label: Text('Reset'),
  ),
),
      ], 
    ),
      ),
    );
  }
}
