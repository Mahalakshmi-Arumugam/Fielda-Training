//Write a dart program to check whether a character is a vowel or consonant.
import 'dart:io';

void main() {
  List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];

  print("Enter an alphabet");
  String? letter = stdin.readLineSync();
  print("Your Letter is $letter");

  if (vowels.contains(letter)) {
    print("Your Letter is a vowel");
  } else {
    print("Your Letter is a consonant");
  }
}
