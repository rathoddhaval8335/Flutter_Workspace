import 'package:flutter/material.dart';

class ColorChangeEx extends StatefulWidget {
  const ColorChangeEx({super.key});

  @override
  State<ColorChangeEx> createState() => _ColorChangeExState();
}

class _ColorChangeExState extends State<ColorChangeEx> {

  Color _bgcolor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgcolor,
    body:Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          ListTile(
            title: Text("White",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
            leading: Radio(
                value: Colors.white,
                groupValue: _bgcolor,
                onChanged: (value){
                  setState(() {
                    _bgcolor=value!;
                  });
                }),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text("Red",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
            leading: Radio(
                value: Colors.red,
                groupValue: _bgcolor,
                onChanged: (value){
                  setState(() {
                    _bgcolor=value!;
                  });
                }),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text("Blue",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
            leading: Radio(
                value: Colors.blue,
                groupValue: _bgcolor,
                onChanged: (value){
                  setState(() {
                    _bgcolor=value!;
                  });
                }),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text("Yellow",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
            leading: Radio(
                value: Colors.yellow,
                groupValue: _bgcolor,
                onChanged: (value){
                  setState(() {
                    _bgcolor=value!;
                  });
                }),
          ),
          SizedBox(height: 10,),
        ],
      ),
    ),
    );
  }
}
