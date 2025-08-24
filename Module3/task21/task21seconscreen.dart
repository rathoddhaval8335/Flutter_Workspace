import 'package:flutter/material.dart';

class Task21seconscreen extends StatefulWidget {
  const Task21seconscreen({super.key});

  @override
  State<Task21seconscreen> createState() => _Task21seconscreenState();
}

class _Task21seconscreenState extends State<Task21seconscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task21"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Welcome Dhaval Rathod",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.red),
        ),
      ),
    );
  }
}
