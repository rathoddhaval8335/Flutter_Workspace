import 'package:flutter/material.dart';
import 'package:task1/20-7/dataget.dart';

class Loopval extends StatefulWidget {
  const Loopval({super.key});

  @override
  State<Loopval> createState() => _LoopvalState();
}

class _LoopvalState extends State<Loopval> {
  TextEditingController val1=new TextEditingController();
  TextEditingController val2=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task1"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: val1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Value 1"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: val2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Value 2"
              ),
            ),
            
            ElevatedButton(onPressed: (){
              int a=int.parse(val1.text.toString());
              int b=int.parse(val2.text.toString());
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Prg2(value:a,val:b)));
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
