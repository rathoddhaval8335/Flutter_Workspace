import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/test/game1.dart';
import 'package:task1/test/game2.dart';

import 'login.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectindex = 0;
  String username = "";
  late SharedPreferences sharedPreferences;

  List _pages = [Game1(), Game2()];

  @override
  void initState() {
    super.initState();
    checkvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            sharedPreferences.setBool("login", true);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login()));

          }, icon: Icon(Icons.logout))
        ],
      ),
      body: _pages[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.games_sharp),
            label: "Game1",
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: "Game2",
            backgroundColor: Colors.greenAccent,
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
      _selectindex = val;
    });
  }

  checkvalue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString("myname") ?? "";
    });
  }
}
