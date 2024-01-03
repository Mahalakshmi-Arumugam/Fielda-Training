import 'package:flutter/material.dart';
import 'package:weather/UserInterface/GetStarted.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: GetStarted(), 
    );
  }
}
