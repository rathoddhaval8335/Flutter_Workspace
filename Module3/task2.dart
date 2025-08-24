/*2.Build a Flutter app with an AppBar that has a title and a FloatingActionButton.
     Use thebutton to increment a counter displayed in the center of the screen.*/


import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {

  double val=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task2"),
        backgroundColor: Colors.red,
      ),
      body:Center(
        child: Column(
          children: [
            Text(
              "Value Is:$val",style: TextStyle(fontSize: 20,color: Colors.blue),
            ),
            FloatingActionButton(onPressed: (){
              setState(() {
                val++;
              });
            },child: Icon(Icons.add),),
          ],
        ),
      ),


    );
  }
}
