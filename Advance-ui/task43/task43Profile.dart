import 'package:flutter/material.dart';
import 'package:task1/Advanced-ui/task43customprofile.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Card"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: CustomeProfile(
            name: "Dhaval Rathod",
            image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtPXUeRGrJrngPgxIsKdgDZK_Dy-SUFlQFsA&s",
            bio: "Flutter Developer"),
      ),
    );
  }
}
