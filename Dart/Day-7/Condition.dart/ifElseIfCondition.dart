//Write a dart program to check whether a number is positive, negative, or zero.
import 'dart:io';

void main() {
  print("Enter a number:");
  num? number = num.parse(stdin.readLineSync()!);
  print("Your number is :$number");
  if (number > 0) {
    print("Your Number is positive");
  } else if (number < 0) {
    print("Your Number is Negative");
  } else {
    print("Your Number is Zero");
  }
}
