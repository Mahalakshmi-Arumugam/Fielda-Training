//Write a program to print a square of a number using user input.

import 'dart:io';

void main() {
  print("Enter the number to be squared:");
  num square = num.parse(stdin.readLineSync()!);
  num squaredNumber = square * square;
  print("The Squared Number is : $squaredNumber");
}
