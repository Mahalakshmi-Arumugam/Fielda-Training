//print the total sum of all numbers and also the average value from the total.
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  int total = 0;

  numbers.forEach((num) => total = total + num);

  print("Total is $total.");

  double avg = total / (numbers.length);

  print("Average is $avg.");
}
