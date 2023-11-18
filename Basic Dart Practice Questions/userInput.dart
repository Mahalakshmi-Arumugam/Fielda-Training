//Write a program to print full name of a from first name and last name using user input.
import 'dart:io';

void main() {
  print("Enter your First Name:");
  String? firstName = stdin.readLineSync();
  print("Your First Name is:${firstName}");

  print("Enter your Last Name:");
  String? lastName = stdin.readLineSync();
  print("Your First Name is:${lastName}");

//By using string concatenation + operator
  print("Your Full Name is " + firstName! + " " + lastName!);

//By using Interpolation
  print("Your Full Name is $firstName $lastName");
}
