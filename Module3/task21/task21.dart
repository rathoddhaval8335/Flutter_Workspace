/*21.Create a two-screen app. The first screen should have a button that navigates to the secondscreen. Display a welcome message on the second screen.*/

import 'package:flutter/material.dart';
import 'package:task1/Module3/task21seconscreen.dart';

class Task21 extends StatefulWidget {
  const Task21({super.key});

  @override
  State<Task21> createState() => _Task21State();
}

class _Task21State extends State<Task21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task21"),
        backgroundColor: Colors.blue,

      ),
      body:Container(
        alignment: Alignment.center,
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Task21seconscreen()));
        }, child: Text("Submit")),
      ) ,
    );
  }
}
