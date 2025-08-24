/*10.Create a shopping cart app with a list of items and an "Add to Cart" button for each.
  Whenthe button is pressed, update a counter in the AppBar showing the total items in the cart.*/
import 'package:flutter/material.dart';

class Task10 extends StatefulWidget {
  const Task10({super.key});

  @override
  State<Task10> createState() => _Task10State();
}

class _Task10State extends State<Task10> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Shopping Cart"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(Icons.add_shopping_cart),
                  const SizedBox(width: 5),
                  Text(
                    "$count",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listOfitem(
                    "https://st.depositphotos.com/1000504/4927/i/950/depositphotos_49279991-stock-photo-burger-on-a-white-background.jpg",
                    "Burger",
                    "Rs.40"),
                listOfitem(
                    "https://t3.ftcdn.net/jpg/02/20/70/50/360_F_220705014_3QM4df2AekmpPtScUrj27CvIH0YUGTXA.jpg",
                    "Pizza",
                    "Rs.50"),
                listOfitem(
                    "https://thumbs.dreamstime.com/b/vada-pav-isolated-white-background-delicious-vada-pav-iconic-indian-street-food-isolated-white-background-showcasing-366163068.jpg",
                    "Vadapav",
                    "Rs.35"),
              ],
            ),
          ),
        ));
  }

  Widget listOfitem(String imageUrl, String itemName, String price) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(itemName),
              subtitle: Text(price),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  CounterButton();
                },
                child: const Text("Add to Cart"),
              ),
            )
          ],
        ),
      ),
    );
  }

  CounterButton() {
    setState(() {
      count++;
    });
  }
}
