import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'adddata.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {

  late SharedPreferences pref;

  String username="";
  String usersurname="";
  @override
  void initState() {
    super.initState();
    loadUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(username),
            subtitle: Text(usersurname),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddData()),
          ).then((value) {
            loadUserData();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> loadUserData() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('name') ?? 'No name';
      usersurname = pref.getString('surname') ?? 'No surname';

    });
  }
}
