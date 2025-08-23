import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomnavigationex.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences sharedPreferences;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passcontroller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Password";
                  }
                  if (val.length < 6) {
                    return "Password Must Be at least 6 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _registerform, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }

  _registerform() async {
    if (_formkey.currentState!.validate()) {
      String name1 = _namecontroller.text.trim();
      String pass1 = _passcontroller.text.trim();

      if (name1 == "Dhaval" && pass1 == "123456") {
        sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setBool("login", false);
        await sharedPreferences.setString("myname", name1);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successfully")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Failed ")),
        );
      }
    }
  }

  checklogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool? newuser = sharedPreferences.getBool('login');

    if (newuser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    }
  }
}
