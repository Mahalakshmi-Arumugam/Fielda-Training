//program that prints name using function. The name of function is printName()
//Function with No Parameter and No return type
import 'dart:io';

void printName() {
  print("Enter Your Name:");
  String? Name = stdin.readLineSync();
  print("Your name is $Name");
}

void main() {
  printName();
}
