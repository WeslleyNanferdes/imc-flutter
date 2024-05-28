import 'dart:math';

import 'package:flutter/material.dart';

bool mascSelectedButton = false;
bool femSelectedButton = false;

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  String estadoIMC = '';
  double _altura = 100;
  double _peso = 50;
  double _idade = 18;
  bool changeTheme = true;
  
  void _selectingButtonMasc(){
    setState(() {
      if(mascSelectedButton == false || femSelectedButton == true){
        mascSelectedButton = true;
        femSelectedButton = false;
      } else{
        mascSelectedButton = false;
      }
    });
  }

  void _selectingButtonFem(){
    setState(() {
      if(femSelectedButton == false || mascSelectedButton == true){
        mascSelectedButton = false;
        femSelectedButton = true;
      } else{
        femSelectedButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: changeTheme ? Colors.grey.shade800 : Colors.grey.shade500,
        appBar: AppBar(
          title: const Text('IMC'),
          backgroundColor: changeTheme ? Colors.grey.shade800 : Colors.grey.shade500,
          centerTitle: true,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  changeTheme = !changeTheme;
                });
              },
              icon: Icon(Icons.lightbulb, color: changeTheme ? Colors.grey.shade500 : Colors.yellow),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _selectingButtonMasc,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mascSelectedButton ? (changeTheme ? Colors.grey.shade600 : Colors.grey.shade300) : (changeTheme ? Colors.grey.shade500 : Colors.grey.shade200)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.male, size: 100, color: changeTheme ? Colors.white : Colors.black),
                            Text('Masculino', style: TextStyle(fontSize: 18.0, color: changeTheme ? Colors.white : Colors.black))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _selectingButtonFem,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(femSelectedButton ? (changeTheme ? Colors.grey.shade600 : Colors.grey.shade300) : (changeTheme ? Colors.grey.shade500 : Colors.grey.shade200)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.male, size: 100, color: changeTheme ? Colors.white : Colors.black),
                            Text('Feminino', style: TextStyle(fontSize: 18.0, color: changeTheme ? Colors.white : Colors.black))
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: changeTheme ? Colors.grey.shade500 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: <Widget>[
                      const Center(
                        child: Text('Altura', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('$_altura', style: TextStyle(fontSize: 24.0, color: changeTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w700)),
                            const Text('cm'),
                          ],
                        ),
                      ),
                      Slider(
                        value: _altura,
                        min: 100,
                        max: 300,
                        divisions: 200,
                        activeColor: changeTheme ? Colors.orange : Colors.blue,
                        inactiveColor: changeTheme ? Colors.grey.shade600 : Colors.grey.shade400,
                        onChanged: (double value){
                          setState((){
                            _altura = value;
                          });
                        }
                      ),
                    ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: changeTheme ? Colors.grey.shade500 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text('Peso'),
                          Text('$_peso', style: TextStyle(color: changeTheme ? Colors.white : Colors.black, fontSize: 32.0),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _peso--;
                                  });
                                },
                                child: const Icon(Icons.remove)
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _peso++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: changeTheme ? Colors.grey.shade500 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text('Idade'),
                          Text('$_idade', style: TextStyle(color: changeTheme ? Colors.white : Colors.black, fontSize: 32.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _idade--;
                                  });
                                },
                                child: const Icon(Icons.remove)
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _idade++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(femSelectedButton ? (changeTheme ? Colors.grey.shade600 : Colors.grey.shade300) : (changeTheme ? Colors.grey.shade500 : Colors.grey.shade200)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if(_peso/pow((_altura/100), 2) < 16){
                            estadoIMC = 'Magreza Grave';
                          } else if(_peso/pow((_altura/100), 2) >= 16 && _peso/pow((_altura/100), 2) <= 16.9){
                            estadoIMC = 'Magreza Moderada';
                          } else if(_peso/pow((_altura/100), 2) >= 17 && _peso/pow((_altura/100), 2) <= 18.5){
                            estadoIMC = 'Magreza Leve';
                          } else if(_peso/pow((_altura/100), 2) >= 18.6 && _peso/pow((_altura/100), 2) <= 24.9){
                            estadoIMC = 'Peso Ideal';
                          } else if(_peso/pow((_altura/100), 2) >= 25 && _peso/pow((_altura/100), 2) <= 29.9){
                            estadoIMC = 'Sobrepeso';
                          } else if(_peso/pow((_altura/100), 2) >= 30 && _peso/pow((_altura/100), 2) <= 34.9){
                            estadoIMC = 'Obesidade Grau I';
                          } else if(_peso/pow((_altura/100), 2) >= 35 && _peso/pow((_altura/100), 2) <= 39.9){
                            estadoIMC = 'Obesidade Grau II';
                          } else{
                            estadoIMC = 'Obesidade Grau III';
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(estadoIMC)),
                          );
                        },
                        child: const Text('Enviar')
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}