/*write a program that calculateInterest(double principal, double rate, double time)
 is a function that returns its simple interest */

//Function with parameter and return type

double calculateInterest(double principal, double rate, double time) {
  double calculateInterest = principal * rate * time / 100;
  return calculateInterest;
}

void main() {
  double principal = 5000;
  double rate = 3;
  double time = 3;
  double result = calculateInterest(principal, rate, time);
  print(result);
}
