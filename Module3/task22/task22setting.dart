
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  var firstname;
  var secondname;
  SettingScreen({required this.firstname, required this.secondname});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 22 - Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Details Screen Data is: ${widget.firstname}", style: TextStyle(
                fontSize: 25
            ),),
            SizedBox(height: 15),
            Text("Details Screen Data is: ${widget.secondname}", style: TextStyle(
                fontSize: 25
            ),),
          ],
        ),
      ),
    );
  }
}
