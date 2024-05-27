import 'package:flutter/material.dart';

bool mascSelectedButton = false;
bool femSelectedButton = false;

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({super.key});

  State<MyApp> createState() => MyAppState();
}

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
        ),
      ),
    );
  }
}
