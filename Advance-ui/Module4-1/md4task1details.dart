import 'package:flutter/material.dart';

class Md4task1details extends StatefulWidget {
  late String productname;
  Md4task1details({required this.productname});

  @override
  State<Md4task1details> createState() => _Md4task1detailsState();
}

class _Md4task1detailsState extends State<Md4task1details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Detais About ${widget.productname}",style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
