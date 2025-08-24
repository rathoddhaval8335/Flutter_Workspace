/*17.Create a registration form with fields for name, email, password, and phone number. Usevalidation to ensure email and password meet specific criteria.*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task17 extends StatefulWidget {
  const Task17({super.key});

  @override
  State<Task17> createState() => _Task17State();
}

class _Task17State extends State<Task17> {

  late String name, email,passsword,contact;
  TextEditingController _namecontroller=new TextEditingController();
  TextEditingController _emailcontroller=new TextEditingController();
  TextEditingController _passcontroller=new TextEditingController();
  TextEditingController _mobilecontroller=new TextEditingController();
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task17"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formkey,
          child:Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _namecontroller,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name"
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please Enter Your Proper Email";
                    }
                    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    if (!RegExp(pattern).hasMatch(val)) {
                      return "Enter a valid Email Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email"
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _passcontroller,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please Enter Your Password";
                    }
                    if(val.length<6){
                      return "Password Must Be at least 6 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password"
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _mobilecontroller,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please Enter Your Mobile No";
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(val)) {
                      return "Mobile No must be exactly 10 digits";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mobile No"
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed:_registerform,child: Text("Register")),
              ],
            ),
          )
      ),
    );
  }

  _registerform() {
    if(_formkey.currentState!.validate()){
      if(name.isEmpty && email.isEmpty && passsword.isEmpty && contact.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The All Data ")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Succesfully")));
      }
     }
    }

}
