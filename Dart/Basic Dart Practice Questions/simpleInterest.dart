//Write a program in Dart that finds simple interest.

import 'dart:io';

void main() {
//By using variables
  num p = 1000;
  num t = 10;
  num r = 2;
  num formula = ((p * t * r) / 100);
  print(formula);

//By using User Input
  print("Enter the principle amount:");
  int principle = int.parse(stdin.readLineSync()!);
  print("Your principal amount is $principle");

  print("Enter the rate percentage in number:");
  int rate = int.parse(stdin.readLineSync()!);
  print("Your rate percentage is $rate");
  
  print("Enter the time in number:");
  int time = int.parse(stdin.readLineSync()!);
  print("Your rate percentage is $time");

  num simpleInterest = ((principle * rate * time) / 100);
  print("Your Simple Interest is :${simpleInterest}");
}
