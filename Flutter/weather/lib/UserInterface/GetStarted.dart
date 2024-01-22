// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'locationBasedWeather.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 85, 255, 1),
              Color.fromRGBO(4, 56, 115, 1),
            ],
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            stops: [0.015, 0.916],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Noto Serif',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/get-started.png'),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LocationBasedWeather()));
                },
                child: Container(
                  height: 50,
                  width: size.width * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 160, 187, 1),
                        Color.fromRGBO(0, 188, 219, 0.90),
                      ],
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                      stops: [0.015, 0.916],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text('Get started',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
