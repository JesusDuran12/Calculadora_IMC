import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcular IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Calculadora(title: 'Caculadora para IMC'),
    );
  }
}

class Calculadora extends StatefulWidget {
  Calculadora({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  final controller_peso = TextEditingController();
  final controller_talla = TextEditingController();
  String muestreImc = "";

  void _calculate_imc(){
    setState(() {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;
      double d = result;
      muestreImc = "IMC es: $d";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller_peso,
                  ),
                  TextFormField(
                    controller: controller_talla,
                  ),
                  RaisedButton(onPressed: () {_calculate_imc();},
                  ),
                  Text('$muestreImc'),
                ],
              ),
            )
        )
    );
  }
  }

