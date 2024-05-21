import 'package:flutter/material.dart';

Color cinzaPagina = Colors.grey.shade700;
Color cinzaBotaoPressionado = Colors.grey.shade600;
Color cinzaBotaoNaoPressionado = Colors.grey.shade500;

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
          builder: (context, constraints) => Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget{
  Button({super.key, required String textoBotao, required estadoBotao});
  late String texto;
  late bool pressionado;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed:(){
        setState(){
          
        }
      },
      child: Text(texto),
    );
  }
}