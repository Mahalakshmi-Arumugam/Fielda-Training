//named parameter using required
void printInfo({required String name, required String gender}) {
  print("Hello $name your gender is $gender.");
}

void main() {
  printInfo(gender: "Female", name: "Mahalakshmi");
  printInfo(gender: "Female", name: "Vennila");
}