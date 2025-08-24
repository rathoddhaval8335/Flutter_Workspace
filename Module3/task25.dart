import 'package:flutter/material.dart';

class Task25 extends StatefulWidget {
  const Task25({super.key});

  @override
  State<Task25> createState() => _Task25State();
}

class _Task25State extends State<Task25> {

  List image=[
    "https://www.devpoojan.in/cdn/shop/articles/HD-Lord-Ram-Pictures.jpg?v=1679112776&width=540",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShJAKz5-fF1W3mWPKA6xK7sOGhMJr8WgdAKQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUp2I1k9md_vp6fmeD30h5KhMEFHfVDedobA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaPPVZ82eHWE86LTTWmdG0Xg4jfYZv9_z4Ag&s",
  ];
  List name=[
    "Ram",
    "Krishna",
    "Mahadev",
    "Arjun"
  ];
  List bio=[
    "One chant, one roar – Jai Shree Ram",
    "Protector of Dharma, Guide of Arjun – Jai Shree Krishna",
    "Destroyer of Evil",
    "Master of Gandiva"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Gesture"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context,index){
           return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(image[index]),),
               title: Text(name[index]),
               subtitle: Text(bio[index]),
           );
      }),
    );
  }
}
