import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fielda_project/carousel_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CarouselPage()),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 350.0,
            height: 350.0,
            child: Image.asset('assets/images/fielda.png'),
          ),
        ),
      ),
    );
  }
}
