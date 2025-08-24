/*6.Design a profile card with Column and Row widgets. Include an avatar (using CircleAvatar), a name, and a short bio text.*/
import 'package:flutter/material.dart';

class Task6 extends StatelessWidget {
  const Task6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:AssetImage("assets/madhav.jpg"),
            radius: 50,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dhaval Rathod", style: TextStyle(fontSize: 15)),
              SizedBox(height: 10),
              Text("Flutter Developer", style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}
