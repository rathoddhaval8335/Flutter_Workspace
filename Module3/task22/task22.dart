/*22.Develop a three-screen app with a home, details, and settings screen. Use
Navigator.pushNamed for navigation, and pass data between screens.*/

import 'package:flutter/material.dart';
import 'package:task1/Module3/task22detailsscreen.dart';

class Task22 extends StatefulWidget {
  const Task22({super.key});

  @override
  State<Task22> createState() => _Task22State();
}

class _Task22State extends State<Task22> {

  TextEditingController txt1=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task22-Home"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: txt1,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter Any Text"
            ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailsscreen(data:txt1.text)));
            }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
