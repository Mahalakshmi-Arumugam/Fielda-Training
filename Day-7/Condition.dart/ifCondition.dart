//Write a dart program to check if the number is odd or even.
import 'dart:io';

void main() {
  print("Enter a number:");
  int? Number = int.parse(stdin.readLineSync()!);
  print("Your number is $Number");
  if (Number % 2 == 0) {
    print("Your given Number $Number is Even");
  }
}
