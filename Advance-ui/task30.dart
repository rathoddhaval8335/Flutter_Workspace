import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 30"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container( color: Colors.blue.shade50,),
          Positioned(
            top: 100,
            left: 160,
            child: CircleAvatar(
              radius: 60,
            backgroundImage:AssetImage( "assets/madhav.jpg"))
          ),

          Positioned(
              top: 240,
              left: 150,
              child: Column(children: [
            Text("Dhaval Rathod",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Flutter Developer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ],))
        ],
      ),
    );
  }
}
