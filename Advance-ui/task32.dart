import 'package:flutter/material.dart';

class Task32 extends StatefulWidget {
  const Task32({super.key});

  @override
  State<Task32> createState() => _Task32State();
}

class _Task32State extends State<Task32> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task32"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Stack(
            alignment: Alignment.center,
            children: [
             Positioned(
                 top: 20,
                 child: Icon(Icons.star,color: Colors.white,size: 30,)
             ),
              Positioned(
                  bottom: 20,
                  child: Text("Star",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
