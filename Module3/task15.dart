/*15.Add an Image.asset widget to display an image from your local assets folder. Experiment
with different BoxFit properties like cover, contain, and fill.*/

import 'package:flutter/material.dart';

class Task15 extends StatefulWidget {
    const Task15({super.key});

    @override
    State<Task15> createState() => _Task15State();
  }

  class _Task15State extends State<Task15> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Task15"),
          backgroundColor:Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 200,
              color: Colors.blue,
              child: Image.asset("assets/madhav.jpg",fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Container(
              height: 150,
              width: 200,
              color: Colors.red,
              child: Image.asset("assets/madhav.jpg",fit: BoxFit.fill,),
            ),
            SizedBox(height: 10,),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: Image.asset("assets/madhav.jpg",fit: BoxFit.contain,),
            ),
            SizedBox(height: 10,),

          ],
        ),
      );
    }
  }
