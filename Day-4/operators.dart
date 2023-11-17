//Operators in Dart
void main() {
  //ARITHMETIC OPERATORS
  // declaring two numbers
  int num1 = 20;
  int num2 = 5;

  // performing arithmetic OPERATIONS
  int sum = num1 + num2; // addition
  int diff = num1 - num2; // subtraction
  int unaryMinus = -num1; // unary minus
  int mul = num1 * num2; // multiplication
  double div = num1 / num2; // division
  int div2 = num1 ~/ num2; // integer division
  int mod = num1 % num2; // Modulus

  print("The addition is $sum.");
  print("The subtraction is $diff.");
  print("The unary minus is $unaryMinus.");
  print("The multiplication is $mul.");
  print("The division is $div.");
  print("The integer division is $div2.");
  print("The modulus is $mod.");

  //INCREMENT AND DECREMENT OPERATORS
  int num3 = 5;

// pre increment and decrement
  int num4 = ++num3;
  print("The value of num4 is $num4");
  int num5 = --num3;
  print("The value of num5 is $num5");

// post increment and decrement
  int num6 = num3++;
  print("The value of num6 is $num6");
  int num7 = num3--;
  print("The value of num7 is $num7");
  int num8 = num3;
  print(num8);

  //ASSIGNMENT OPERATOR
  double age = 10;
  age += 1; // Here age+=1 means age = age + 1.
  print("After Addition Age is $age");
  age -= 1;
  print("After Subtraction Age is $age");
  age *= 2;
  print("After Multiplication Age is $age");
  age /= 2;
  print("After Division Age is $age");

  //RELATIONAL OPERATORS
  int Num1 = 10;
  int Num2 = 20;

  print(Num1 == num2);
  print(Num1 < Num2);
  print(Num1 > Num2);
  print(Num1 <= Num2);
  print(Num1 >= Num2);

  //LOGICAL OPERATORS
  int userid = 123;
  int userpin = 456;

  print((userid == 123) && (userpin == 456));
  print((userid == 1213) && (userpin == 456));
  print((userid == 123) || (userpin == 456));
  print((userid == 123) != (userpin == 456));

  //TYPE TEST OPERATOR
  String mYNAME = "Mahalakshmi";
  int myAge = 21;

  print(mYNAME is String);
  print(myAge is! int);
}
