/*1.Create a simple "Hello World" Flutter app with a Text widget displaying "Hello, Flutter!"centered on the screen.*/
import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task1"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Text("Hello, Flutter! ",style: TextStyle(fontSize: 20,color: Colors.red),
          )
      ),
    );
  }
}
