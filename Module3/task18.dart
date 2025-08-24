/*18.Build a feedback form with TextField widgets for entering name and comments, andaDropdownButton for selecting a feedback category.*/

import 'package:flutter/material.dart';

class Task18 extends StatefulWidget {
  const Task18({super.key});

  @override
  State<Task18> createState() => _Task18State();
}

class _Task18State extends State<Task18> {
  TextEditingController _namecontroller=new TextEditingController();
  TextEditingController _commetcontroller=new TextEditingController();

  String? _Selectcategory="";

  List<String> _category=[

    "App Issue",
    "Feature Request",
    "General Feedback",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task18"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller:_namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name"
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _commetcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Comments"
              ),
            ),
            SizedBox(height: 15,),
            DropdownButtonFormField(
              hint: Text("Select Category"),
                items: _category.map((catrgory){
                  return DropdownMenuItem(value: catrgory,
                    child: Text(catrgory),
                  );
                }).toList(),
                onChanged: (val){
                  setState(() {
                    _Selectcategory=val!;
                  });
                },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: _submitfeedback, child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  _submitfeedback() {
    String name=_namecontroller.text.toString();
    String comment=_commetcontroller.text.toString();
    if(name.isEmpty || comment.isEmpty || _Selectcategory==null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The All Feilds")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Feedback Submitted\n Name:$name \n Category:$_Selectcategory"))
      );
      _namecontroller.clear();
      _commetcontroller.clear();
      setState(() {
        _Selectcategory=null;
      });
    }
  }
}
