/*3.Create an app with two Text widgets.
 Apply different TextStyle properties (like font size, color, and weight) to each widget to explore styling options.*/

import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  const Task3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task3"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Text("Hello",
            style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 20,),
          Text("Flutter",
             style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
