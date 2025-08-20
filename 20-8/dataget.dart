import 'package:flutter/material.dart';

class Prg2 extends StatefulWidget {

  int value,val;
  Prg2({required this.value,required this.val});

  @override
  State<Prg2> createState() => _Prg2State();
}

class _Prg2State extends State<Prg2> {
  @override
  Widget build(BuildContext context) {
    List number=[];
    for(int i=widget.value+1 ; i<widget.val; i++){
      number.add(i);
    }
    return Scaffold(
      body: ListView.builder(
          itemCount: number.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${number[index]}",style: TextStyle(fontSize: 20),),
            );
          }),
    );
  }
}
