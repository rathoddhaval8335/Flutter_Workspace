import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterCont extends StatelessWidget{
   const CounterCont ({super.key});
   
   @override
  Widget build(BuildContext context) {
     final CounterController controller=Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Ex 2"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(()=>Text("${controller.a}")),
      ),
      floatingActionButton:FloatingActionButton(onPressed: controller.Increment,child: Icon(Icons.add),)
    );
  }
}

class CounterController extends GetxController{
  var a=0.obs;

  void Increment(){
    a++;
  }
}
