/*12.Make a toggle switch that changes the app’s background color when turned on or off. UsetheSwitch widget to handle the toggle state*/

import 'package:flutter/material.dart';

class Task12 extends StatefulWidget {
  const Task12({super.key});

  @override
  State<Task12> createState() => _Task12State();
}

class _Task12State extends State<Task12> {

  bool isSwichted=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwichted ? Colors.red:Colors.white,
      appBar: AppBar(
        title: Text("Toggele"),

      ),
      body: Switch(
          value: isSwichted,
          onChanged: (val){
            setState(() {
              isSwichted=val;
            });
          }
      ),

    );
  }
}
