/*Build a grid of images using the GridView widget. Load images from the network, anddisplay four images per row.*/

import 'package:flutter/material.dart';

class Task7 extends StatelessWidget {
  const Task7({super.key});

  @override
  Widget build(BuildContext context) {
    List image_url=[
      
       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgHdSTkINZKTagyttsByxpTDqRmA-eNUXvcg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiU7wzO1WTEpHa3mZb0BWeyjibKG1yDTZNYA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd0lfPEU4XFVKq2zM-LGeyF20wtjmKP-05kw&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3-QYMenLTHg39v8BzPVPlnGOFzBzOFqIr8w&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmYodNVHPZrWYL6QBp-ih8PzZukuDrynNhMg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgHdSTkINZKTagyttsByxpTDqRmA-eNUXvcg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiU7wzO1WTEpHa3mZb0BWeyjibKG1yDTZNYA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd0lfPEU4XFVKq2zM-LGeyF20wtjmKP-05kw&s",

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview"),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4

          ),
          itemCount: image_url.length,
          itemBuilder: (context,index){
            return Image.network(image_url[index],fit: BoxFit.cover,);
          }),
    );
  }
}
