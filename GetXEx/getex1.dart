import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GetEx1 extends StatelessWidget {

  var counter=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetEx1"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(()=>Text("Count Val:$counter")),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter++;
      },child: Icon(Icons.add),),
    );
  }
}
