/*Create a screen with ListView.builder to display a list of names. When tapped, eachnameshould print "Name tapped" in the console.*/
import 'package:flutter/material.dart';

class Task8 extends StatelessWidget {
  const Task8({super.key});

  @override
  Widget build(BuildContext context) {

    List Name=[
      "Dhaval",
      "Kalpesh",
      "Rohit",
      "Bhavesh",
      "Jaydip",
      "Ayush",
      "Kartik",
      "Amit",
      "Dinesh",
      "Vipul",
      "Piyush",
      "Sailesh",
      "Kishor",
      "Vijay",
      "Nilesh",
      "Hari",
      "Dipak",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: Name.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(Name[index]),
              onTap: (){
                print("Name Tapped");
              },
            );
          }),
    );
  }
}
