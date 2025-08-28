import 'package:flutter/material.dart';

class Task31 extends StatefulWidget {
  const Task31({super.key});

  @override
  State<Task31> createState() => _Task31State();
}

class _Task31State extends State<Task31> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task31"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              color: Colors.grey,
              height: 300,
              width: 300,
              padding: EdgeInsets.all(15),
              child: Text("This Is Flutter Card"),
            ),
          ),
          Positioned(
            right: 16,
              bottom: 16,
              child: FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.add),
              )
          )
        ],
      )
    );
  }
}
