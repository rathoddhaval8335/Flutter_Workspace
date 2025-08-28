import 'package:flutter/material.dart';

import 'task44avatarbage.dart';

class ProfileScreenEx extends StatelessWidget {
  const ProfileScreenEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Profile Screen")),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 20),

            AvatarBadge(
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtPXUeRGrJrngPgxIsKdgDZK_Dy-SUFlQFsA&s",
              isOnline: true,
            ),

             SizedBox(height: 10),
             Text(
              "Dhaval Rathod",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
             Text(
              "Flutter Developer | Tech Enthusiast",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

             SizedBox(height: 20),

            Container(
              padding:  EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child:  Text(
                "Product Catalog",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              children: [
                productCard(
                    "Laptop", "₹55,000", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGhrc-lfoLRIBkJfjUbg54bISTzMHanZgg1Q&s"),
                productCard(
                    "Headphones", "₹2,500", "https://www.unboxify.in/cdn/shop/products/51zL2U_3bDL._SL1200.jpg?v=1694963807"),
                productCard(
                    "Smartphone", "₹35,000", "https://m.media-amazon.com/images/I/61zwK7mmLtL.jpg"),
              ],
            ),

             SizedBox(height: 20),
            customButton("Edit Profile", Colors.blue),
             SizedBox(height: 10),
            customButton("Log Out", Colors.red),
          ],
        ),
      ),
    );
  }
  Widget productCard(String name, String price, String imageUrl) {
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
           SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                     TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(price,
                    style:  TextStyle(fontSize: 16, color: Colors.green)),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget customButton(String text, Color color) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 50),
      padding:  EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style:  TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}