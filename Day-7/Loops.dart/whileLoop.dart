//Write a dart program to generate multiplication tables of 5.
void main() {
  int number = 5;
  print("Multiplication Table for $number:");

  int i = 1;
  while (i <= 12) {
    int result = number * i;
    print("$number * $i = $result");
    i++;
  }
}
