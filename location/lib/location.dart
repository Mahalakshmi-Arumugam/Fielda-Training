import 'package:flutter/material.dart';
import 'package:location/search.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your\nlocation?",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
           
            Text(
              "We need your location to show available places",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            SearchBox(),
          ],
        ),
      ),
    );
  }
}
