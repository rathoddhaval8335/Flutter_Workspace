import 'package:flutter/material.dart';
import 'package:task1/Advanced-ui/md4task1product.dart';

class Md4task1Home extends StatelessWidget {
  const Md4task1Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Md4task1product()));
        }, child: Text("Go To Product List")),
      ),
    );
  }
}
