/*11. Design a counter app with increment and decrement buttons.
  Use setState to update thedisplayed value as the buttons are pressed.*/

import 'package:flutter/material.dart';

class Task11 extends StatefulWidget {
  const Task11({super.key});

  @override
  State<Task11> createState() => _Task11State();
}

class _Task11State extends State<Task11> {
  @override

  int val=0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Counter Value:",style: TextStyle(color: Colors.red,fontSize: 20),),
                  Text("$val",style: TextStyle(color: Colors.red,fontSize: 20),),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(val>0){
                        val--;
                      }
                    });
                  }, child: Text("-")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      val++;
                    });
                  }, child: Text("+"))
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
