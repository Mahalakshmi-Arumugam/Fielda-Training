// voterAge() is a function which returns minimum voter age.

// Function With No Parameter & Return Type
import 'dart:io';

int voterAge() {
  int voterAge = 18;
  return voterAge;
}

void main() {
  print("Enter your age:");
  int? age = int.parse(stdin.readLineSync()!);
  if (age >= voterAge()) {
    print("You are eligible to vote");
  } else {
    print("You are not eligible to vote");
  }
}
