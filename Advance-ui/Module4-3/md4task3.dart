import 'package:flutter/material.dart';

import 'md4task3home.dart';
import 'md4task3profile.dart';
import 'md4task3setting.dart';

class Module4prg3 extends StatefulWidget {
  const Module4prg3({super.key});

  @override
  State<Module4prg3> createState() => _Module4prg3State();
}

class _Module4prg3State extends State<Module4prg3> {
  
  List Pages=[
    Module4prg3home(),
    Md4task3profile(),
    Md4task3setting()
  ];
  int _SelectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Ex"),
        backgroundColor: Colors.blue,
      ),
      body: Pages[_SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              backgroundColor: Colors.greenAccent,
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: "Profile",
              backgroundColor: Colors.greenAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
                backgroundColor: Colors.greenAccent
            )
          ],
         type: BottomNavigationBarType.shifting,
         currentIndex: _SelectedIndex,
         selectedItemColor: Colors.black,
         iconSize: 15,
         elevation: 5,
         onTap: _OnTapped,
      ),
    );
  }
  _OnTapped(int val){
    setState(() {
      _SelectedIndex=val;
    });
  }
}
