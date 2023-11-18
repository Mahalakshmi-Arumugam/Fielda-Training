import 'dart:io';

void main() {
  // String User Input
  print("Enter your name:");
  String? name = stdin.readLineSync();
  print("Your name is $name");

  //Integer User Input
  print("Enter your age:");
  int? age = int.parse(stdin.readLineSync()!);
  print("Your age is ${age}");

  //Double User Input
  print("Enter your height:");
  double? height = double.parse(stdin.readLineSync()!);
  print("Your age is ${height}");

  //Any Datatype as User Input
  print("Enter your Salary:");
  var Salary = stdin.readLineSync();
  print("Your Salary is ${Salary}");
}
