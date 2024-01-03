class PersonInfo {
  String printInfo(String name, String gender, [String? title =""]) {
    return "Hello $title $name, your gender is $gender."; 
  }
}

void main() {
  PersonInfo personInfo = PersonInfo();

 print(personInfo.printInfo("Arumugam", "Male"));
  // personInfo.printInfo("Virat Kohli", "Male", "Mr.");
  // personInfo.printInfo("Mahalakshmi", "Female", "Ms.");
}
