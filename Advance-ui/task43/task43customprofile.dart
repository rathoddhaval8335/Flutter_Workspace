import 'package:flutter/material.dart';

class CustomeProfile extends StatefulWidget {
  late final String name;
  late final String image_url;
  late final String bio;

  CustomeProfile({super.key, required this.name,required this.image_url,required this.bio});

  @override
  State<CustomeProfile> createState() => _CustomeProfileState();
}

class _CustomeProfileState extends State<CustomeProfile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 50,backgroundImage: NetworkImage(widget.image_url),),
            SizedBox(height: 12,),
            Text(widget.name, style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 12,),
            Text(widget.bio,style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
    );
  }
}
