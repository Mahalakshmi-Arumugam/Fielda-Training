//program to find total number of days in a month using switch...case
import 'dart:io';

void main() {
  print("Enter the number of the month(1-12):");
  int? month = int.parse(stdin.readLineSync()!);

  switch (month) {
    case 1:
      print("31 days");
      break;
    case 2:
      print("28/29 days");
      break;
    case 3:
      print("31 days");
      break;
    case 4:
      print("30 days");
      break;
    case 5:
      print("31 days");
      break;
    case 6:
      print("30 days");
      break;
    case 7:
      print("31 days");
      break;
    case 8:
      print("31 days");
      break;
    case 9:
      print("30 days");
      break;
    case 10:
      print("31 days");
      break;
    case 11:
      print("30 days");
      break;
    case 12:
      print("31 days");
      break;
    default:
      print("Invalid input! Please enter month number between 1-12");
  }
}
