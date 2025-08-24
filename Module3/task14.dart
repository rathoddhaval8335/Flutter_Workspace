/*14.Develop a photo gallery app using GridView to display multiple images fromURLs. Includea loading indicator while images are loading.*/

import 'package:flutter/material.dart';

class Task14 extends StatefulWidget {
  const Task14({super.key});

  @override
  State<Task14> createState() => _Task14State();
}

class _Task14State extends State<Task14> {

  List image_url=[
    "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVyY2VkZXN8ZW58MHx8MHx8fDA%3D",
     "https://t3.ftcdn.net/jpg/03/08/73/14/360_F_308731491_DlnGiXGy2fS5bT2QKCpSpLfgCtqlPaKT.jpg",
     "https://images.pexels.com/photos/2365572/pexels-photo-2365572.jpeg?cs=srgb&dl=pexels-mikebirdy-2365572.jpg&fm=jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXVTBfYb1wgjUX96zKUYxbZ6lYT22m3UWZ-g&s",
     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtMYtzQbqNfPcz_VLHKbJ1yuZsw9wbEYe9eA&s",
    "https://images.pexels.com/photos/2365572/pexels-photo-2365572.jpeg?cs=srgb&dl=pexels-mikebirdy-2365572.jpg&fm=jpg",
     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXVTBfYb1wgjUX96zKUYxbZ6lYT22m3UWZ-g&s",
    "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVyY2VkZXN8ZW58MHx8MHx8fDA%3D",
    "https://t3.ftcdn.net/jpg/03/08/73/14/360_F_308731491_DlnGiXGy2fS5bT2QKCpSpLfgCtqlPaKT.jpg",
    "https://images.pexels.com/photos/2365572/pexels-photo-2365572.jpeg?cs=srgb&dl=pexels-mikebirdy-2365572.jpg&fm=jpg",
    "https://t3.ftcdn.net/jpg/03/08/73/14/360_F_308731491_DlnGiXGy2fS5bT2QKCpSpLfgCtqlPaKT.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallerry"),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4
        ),
          itemCount: image_url.length,
          itemBuilder: (context,index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(image_url[index],
                height: 200,
                width: 200,fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress==null) return child;
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                },
              ),
            );
          }),
    );
  }
}
