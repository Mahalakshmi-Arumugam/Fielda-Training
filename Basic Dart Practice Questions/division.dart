//Write a program to find quotient and remainder of two integers.

import 'dart:io';
void main(){
  print("Enter the Dividend:");
  int Dividend = int.parse(stdin.readLineSync()!);
  print("The Dividend is:$Dividend");

   print("Enter the Divisor:");
  int Divisor = int.parse(stdin.readLineSync()!);
  print("The Divisor is:$Divisor");

  int quotient=(Dividend ~/ Divisor);
  print("The quotient is :$quotient");

  int remainder=(Dividend % Divisor);
   print("The remainder is :$remainder");


}