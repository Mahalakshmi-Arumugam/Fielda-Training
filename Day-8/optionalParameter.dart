void printInfo(String name, String gender, [String? title="Mr/Ms."]) {
  print("Hello $title $name your gender is $gender.");
}

void main() {
  printInfo("Arumugam", "Male");
  printInfo("ViratKohli", "Male", "Mr.");
  printInfo("Mahalakshmi", "Female", "Ms.");
}