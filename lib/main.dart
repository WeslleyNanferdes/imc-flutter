import 'package:flutter/material.dart';

Color cinzaPagina = Colors.grey.shade700;
Color cinzaBotaoPressionado = const Color.fromRGBO(117, 117, 117, 1);
Color cinzaBotaoNaoPressionado = Colors.blue;

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora IMC', style: TextStyle(color: Colors.white, fontSize: 24),),
          centerTitle: true,
          backgroundColor: cinzaPagina,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => const Column(
            children: <Widget>[
              Button(text: 'botão 1')
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget{
  final String text;
  static bool estadoButton = false;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed:() {
        if (estadoButton == false){
          estadoButton = true;
        } else{
          estadoButton = false;
        } 
      },
      style: ElevatedButton.styleFrom(
         backgroundColor: estadoButton ? cinzaBotaoPressionado : cinzaBotaoNaoPressionado,
      ),
      child: Text(text),
    );
  }
}