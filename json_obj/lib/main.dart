// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_obj/cake.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cake List'),
        ),
        body: const CakeList(),
      ),
    );
  }
}

class CakeList extends StatefulWidget {
  const CakeList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CakeListState createState() => _CakeListState();
}

class _CakeListState extends State<CakeList> {
  late List<Cake> cakes;

  @override
  void initState() {
    super.initState();
    loadCakes();
  }

  Future<void> loadCakes() async {
    String jsonString = '';
    try {
      jsonString = await rootBundle.loadString('assets/cake.json');
    } catch (e) {
      // ignore: avoid_print
      print('Error loading JSON file: $e');
    }
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      cakes = jsonList.map((e) => Cake.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cakes == null ? 0 : cakes.length,
      itemBuilder: (context, index) {
        if (cakes == null) {
          return const CircularProgressIndicator(); 
        }
        return ListTile(
          title: Text(cakes[index].cakeName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: ₹${cakes[index].price.toString()}'),
              Text('Actual Price: ₹${cakes[index].actualPrice.toString()}'),
              Text('Quantity: ${cakes[index].quantity}'),
            ],
          ),
        );
      },
    );
  }
}
