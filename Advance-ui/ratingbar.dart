import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingbarEx extends StatefulWidget {
  const RatingbarEx({super.key});

  @override
  State<RatingbarEx> createState() => _RatingbarExState();
}

class _RatingbarExState extends State<RatingbarEx> {
  double _rating=3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Bar"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
           RatingBar.builder(
              minRating: 1,
              allowHalfRating: true,
              itemCount: 5,
              direction: Axis.horizontal,
              itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
              onRatingUpdate: (rating){
                setState(() {
                  _rating=rating;
                });
              }
          ),
          SizedBox(height: 15,),
          Text("Current Rating:$_rating",style: TextStyle(fontSize: 20,),)
        ],

      ),
    );
  }
}
