import 'package:flutter/material.dart';
import 'gradientContainer.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer.purple(),
      ),
    ),
  );
}
