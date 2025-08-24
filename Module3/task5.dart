/*5.Create a responsive layout using a Row widget with three Container widgets, each withdifferent background colors and widths.*/
import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  const Task5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task5"),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 120,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            flex: 4,
            child: Container(
              height: 120,
              color: Colors.yellow,
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            flex: 4,
            child: Container(
              height: 120,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
