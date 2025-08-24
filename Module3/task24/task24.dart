/*24.Design a bottom navigation bar with three tabs: News, Messages, and Profile. Change thedisplayed content based on the selected tab.*/

import 'package:flutter/material.dart';

import 'task24message.dart';
import 'task24news.dart';
import 'task24profile.dart';

class Task24 extends StatefulWidget {
  const Task24({super.key});

  @override
  State<Task24> createState() => _Task24State();
}

class _Task24State extends State<Task24> {

  int _selectindex=0;
  List _pages=[Task24news(),Task24message(),Task24profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task24"),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: "News",
              backgroundColor: Colors.greenAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Message",
                backgroundColor: Colors.greenAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: "Profile",
                backgroundColor: Colors.greenAccent
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectindex,
          selectedItemColor: Colors.black,
          iconSize: 25,
          elevation: 5,
          onTap: _onTapTapped,
      ),
    );
  }

  _onTapTapped(int val) {
    setState(() {
      _selectindex=val;
    });
  }
}
