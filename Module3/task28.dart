import 'package:flutter/material.dart';

class Task28 extends StatefulWidget {
  const Task28({super.key});

  @override
  State<Task28> createState() => _Task28State();
}

class _Task28State extends State<Task28> {
  List image = [
    "https://www.devpoojan.in/cdn/shop/articles/HD-Lord-Ram-Pictures.jpg?v=1679112776&width=540",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShJAKz5-fF1W3mWPKA6xK7sOGhMJr8WgdAKQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUp2I1k9md_vp6fmeD30h5KhMEFHfVDedobA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaPPVZ82eHWE86LTTWmdG0Xg4jfYZv9_z4Ag&s",
  ];
  List name = ["Ram", "Krishna", "Mahadev", "Arjun"];
  List bio = [
    "One chant, one roar – Jai Shree Ram",
    "Protector of Dharma, Guide of Arjun – Jai Shree Krishna",
    "Destroyer of Evil",
    "Master of Gandiva"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task28"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: 250, // fixed height for horizontal scroll
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: name.length,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(image[index]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      name[index],
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        bio[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
