/*4.Make a "Login Screen" with two TextField widgets for email and password inputs,
and a RaisedButton or ElevatedButton widget for the login button.*/

import 'package:flutter/material.dart';


class Task4 extends StatefulWidget {
  const Task4({super.key});

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task4"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your Email"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Password"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){},
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.grey,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
