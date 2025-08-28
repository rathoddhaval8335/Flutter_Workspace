/*23.Create a navigation drawer that allows switching between three different screens: Home, Profile, and Settings.*/

import 'package:flutter/material.dart';

import 'md4task2home.dart';
import 'md4task2profile.dart';
import 'md4task2setting.dart';

class Module4prg2 extends StatefulWidget {
  const Module4prg2({super.key});

  @override
  State<Module4prg2> createState() => _Module4prg2State();
}

class _Module4prg2State extends State<Module4prg2> {

  int _selectindex=0;
  List<Widget> _screen=[
    Module4home(),
    Module4profile(),
    Module4Setting(),
  ];
  List pagetitle=["Home","Profile","Setting"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(pagetitle[_selectindex]),
      ),
      body: _screen[_selectindex],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Dhaval Rathod"),
              accountEmail: Text("Dj122@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("D",style: TextStyle(fontSize: 40),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                setState(() {
                  _selectindex=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_off),
              title: Text("Profile"),
              onTap: (){
                setState(() {
                  _selectindex=1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: (){
                setState(() {
                  _selectindex=2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
