import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

<<<<<<< HEAD
Color cinzaPagina = Colors.grey.shade700;
Color cinzaBotaoPressionado = Colors.grey.shade600;
Color cinzaBotaoNaoPressionado = Colors.grey.shade500;
bool estadoButtonMasc = false;
bool estadoButtonFem = false;

=======
bool mascSelectedButton = false;
bool femSelectedButton = false;
>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({super.key});

  State<MyApp> createState() => MyAppState();
}

<<<<<<< HEAD
class _MyApp extends State<MyApp>{
  
  void trocarCorMasc(){
    setState(() {
      if(estadoButtonMasc == false || estadoButtonFem == true){
        estadoButtonMasc = true;
        estadoButtonFem = false;
      } else {
        estadoButtonMasc = false;
=======
class MyAppState extends State<MyApp>{
  double _value = 100;
  bool changeTheme = true;
  
  void _selectingButtonMasc(){
    setState(() {
      if(mascSelectedButton == false || femSelectedButton == true){
        mascSelectedButton = true;
        femSelectedButton = false;
      } else{
        mascSelectedButton = false;
>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc
      }
    });
  }

<<<<<<< HEAD
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
  
=======
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

>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
<<<<<<< HEAD
        backgroundColor: cinzaPagina,
=======
        backgroundColor: changeTheme ? Colors.grey.shade800 : Colors.grey.shade500,
>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc
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
<<<<<<< HEAD
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
=======
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _selectingButtonMasc,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(mascSelectedButton ? (changeTheme ? Colors.grey.shade600 : Colors.grey.shade300) : (changeTheme ? Colors.grey.shade500 : Colors.grey.shade200)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
                        backgroundColor: WidgetStateProperty.all<Color>(femSelectedButton ? (changeTheme ? Colors.grey.shade600 : Colors.grey.shade300) : (changeTheme ? Colors.grey.shade500 : Colors.grey.shade200)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
              padding: EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: changeTheme ? Colors.grey.shade500 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: const Text('Altura', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('${_value}', style: TextStyle(fontSize: 24.0, color: changeTheme ? Colors.white : Colors.black, fontWeight: FontWeight.w700)),
                            const Text('cm'),
                          ],
                        ),
                      ),
                      Slider(
                        value: _value,
                        min: 100,
                        max: 300,
                        divisions: 200,
                        activeColor: changeTheme ? Colors.orange : Colors.blue,
                        inactiveColor: changeTheme ? Colors.grey.shade600 : Colors.grey.shade400,
                        onChanged: (double value){
                          setState((){
                            _value = value;
                          });
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc
        ),
      ),
    );
  }
}
<<<<<<< HEAD



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
=======
>>>>>>> 3b91811dbe139226a51d09bacc86d103b03de7fc
