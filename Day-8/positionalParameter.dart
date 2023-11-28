//Positional Parameter in dart
void printInfo(String name, int age, String gender) {
  print("your name is : $name");
  print("Your age is :$age ");
  print("Your gender is :$gender");
}

void main() {
  printInfo("Mahalakshmi", 21, "Female");
  //passing in wrong order
  printInfo("Female", 21, "Mahalakshmi");
}
