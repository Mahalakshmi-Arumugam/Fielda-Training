//Write a program to print your name in Dart.

import 'dart:io';

void main() {
  //By User Input
  print("Enter Your Name:");
  String?yourName=stdin.readLineSync();
  print("Your Name is ${yourName}");

  //By simple print statement
  print("My name is Mahalakshmi");

  //By using variable

  String name = "Mahalakshmi";
  print("My name is $name");


}