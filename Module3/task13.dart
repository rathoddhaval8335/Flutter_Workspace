/*13.Create an app with an Image widget displaying a picture from the network.
   Add a buttonbelow the image to change the image source when pressed.*/
import 'package:flutter/material.dart';

class Task13 extends StatefulWidget {
  const Task13({super.key});

  @override
  State<Task13> createState() => _Task13State();
}

class _Task13State extends State<Task13> {

  String image_url="https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVyY2VkZXMlMjBjYXJ8ZW58MHx8MHx8fDA%3D";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Example"),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          Image.network(image_url,height: 200,width: 200,fit: BoxFit.cover,),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            setState(() {
              if(image_url=="https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVyY2VkZXMlMjBjYXJ8ZW58MHx8MHx8fDA%3D"){
                image_url="https://images.pexels.com/photos/1719647/pexels-photo-1719647.jpeg?cs=srgb&dl=pexels-ryan-west-838532-1719647.jpg&fm=jpg";
              }else{
                image_url="https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVyY2VkZXMlMjBjYXJ8ZW58MHx8MHx8fDA%3D";
              }
            });
          }, child: Text("Change Image"))
        ],
      )
    );
  }
}
