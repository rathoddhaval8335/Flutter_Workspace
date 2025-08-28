import 'package:flutter/material.dart';

import 'md4task1details.dart';

class Md4task1product extends StatefulWidget {
  const Md4task1product({super.key});

  @override
  State<Md4task1product> createState() => _Md4task1productState();
}

class _Md4task1productState extends State<Md4task1product> {

  List ProductName=[
    "Laptop",
    "Mobile",
    "Camera",
    "Headphone",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: ProductName.length,
          itemBuilder: (context,index){
          return ListTile(
            title: Text(ProductName[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Md4task1details(productname:ProductName[index])));
            },
          );
      }),
    );
  }
}
