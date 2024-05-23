import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Color cinzaPagina = Colors.grey.shade700;
Color cinzaBotaoPressionado = Colors.grey.shade600;
Color cinzaBotaoNaoPressionado = Colors.grey.shade500;
bool estadoButtonMasc = false;
bool estadoButtonFem = false;


void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  
  void trocarCorMasc(){
    setState(() {
      if(estadoButtonMasc == false || estadoButtonFem == true){
        estadoButtonMasc = true;
        estadoButtonFem = false;
      } else {
        estadoButtonMasc = false;
      }
    });
  }

  void trocarCorFem(){
    setState(() {
      if(estadoButtonFem == false || estadoButtonMasc == true){
        estadoButtonFem = true;
        estadoButtonMasc = false;
      } else {
        estadoButtonFem = false;
      }
    });
  }
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: cinzaPagina,
        appBar: AppBar(
          title: const Text('Calculadora IMC', style: TextStyle(color: Colors.white, fontSize: 24),),
          centerTitle: true,
          backgroundColor: cinzaPagina,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Button(text: 'Masculino', mudarEstadoButton: trocarCorMasc, estadoButton: estadoButtonMasc, icone: Icons.male),
                  const SizedBox(width: 40),
                  Button(text: 'Feminino', mudarEstadoButton: trocarCorFem, estadoButton: estadoButtonFem, icone: Icons.female)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}



class Button extends StatelessWidget{
  final String text;
  final IconData icone;
  final bool estadoButton;
  final void Function() mudarEstadoButton;
  const Button({super.key, required this.text, required this.mudarEstadoButton, required this.estadoButton, required this.icone});

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: mudarEstadoButton,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(estadoButton ? cinzaBotaoPressionado : cinzaBotaoNaoPressionado),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
        ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 25, 5, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(icone, size: 128, color: Colors.white,),
                  const SizedBox(height: 8),
                  Text(text, style: const TextStyle(fontSize: 32)),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}