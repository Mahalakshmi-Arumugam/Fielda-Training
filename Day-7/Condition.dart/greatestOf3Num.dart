//Find Greatest Number Among 3 Numbers
import 'dart:io';

void main() {
  print("Enter a num1:");
  num? num1 = num.parse(stdin.readLineSync()!);
  print("Enter a num2:");
  num? num2 = num.parse(stdin.readLineSync()!);
  print("Enter a num3:");
  num? num3 = num.parse(stdin.readLineSync()!);
  
  if (num1 > num2) {
    print("Your Num1 is greater");
  } else if (num2 > num3) {
    print("Your Num2 is greater");
  } else if (num1 > num3) {
    print("Your Num1 is greater");
  } else {
    print("Num3 is greater");
  }
}
