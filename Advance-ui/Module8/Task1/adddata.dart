import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  late SharedPreferences preferences;

  TextEditingController namecont=new TextEditingController();
  TextEditingController surcont=new TextEditingController();
  TextEditingController emailcont=new TextEditingController();
  TextEditingController passcont=new TextEditingController();

  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Data"), backgroundColor: Colors.blue),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextFormField(
                controller: namecont,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Your Name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: surcont,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Your Surname";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Surname",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailcont,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Your Email";
                  }
                  String pattern=r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  RegExp reg=RegExp(pattern);
                  if(!reg.hasMatch(val)){
                    return "Please Enter Your Proper Email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passcont,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Your Name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {

                if(_formkey.currentState!.validate()){
                  saveData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign Up Successful')),
                  );
                  Navigator.pop(context);
                }else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Invalid')));
                }

              }, child: Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveData() async{
    preferences=await SharedPreferences.getInstance();
    await preferences.setString("name", namecont.text.toString());
    await preferences.setString("surname", surcont.text.toString());
    await preferences.setString("email", emailcont.text.toString());
    await preferences.setString("pass", passcont.text.toString());
  }
}
