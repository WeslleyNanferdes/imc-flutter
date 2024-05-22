import 'package:flutter/material.dart';

Color cinzaPagina = Colors.grey.shade700;
Color cinzaBotaoPressionado = Colors.blue;
Color cinzaBotaoNaoPressionado = Colors.grey.shade600;
bool estadoButton = false;

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
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed:() {
        setState((){

        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(estadoButton ? cinzaBotaoPressionado : cinzaBotaoNaoPressionado),
      ),
      child: Text(text),
    );
  }
}