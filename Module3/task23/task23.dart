/*23.Create a navigation drawer that allows switching between three different screens: Home, Profile, and Settings.*/

import 'package:flutter/material.dart';
import 'package:task1/Module3/task23home.dart';
import 'package:task1/Module3/task23profile.dart';
import 'package:task1/Module3/task23settingd.dart';

class Task23 extends StatefulWidget {
  const Task23({super.key});

  @override
  State<Task23> createState() => _Task23State();
}

class _Task23State extends State<Task23> {

  int _selectindex=0;
  List<Widget> _screen=[
    Task23home(),
    Task23profile(),
    Task23settin(),
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
