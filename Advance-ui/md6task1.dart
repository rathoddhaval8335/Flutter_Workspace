import 'package:flutter/material.dart';



class Module6Prg1 extends StatefulWidget {
  const Module6Prg1({super.key});

  @override
  State<Module6Prg1> createState() => _Module6Prg1State();
}

class _Module6Prg1State extends State<Module6Prg1> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();


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
                controller: _emailcontroller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Succesfully ")),
        );
      }
    }

}
