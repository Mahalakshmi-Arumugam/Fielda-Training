void main() {
  //Numbers Datatype
  int WholeNumber = 10;
  print("The integer value is:$WholeNumber");

  double floatingNumber = 12.5;
  print("The floating value is:$floatingNumber");

  //Round Double Value
  double price = 15.2229;
  print(price.toStringAsFixed(2));

  num number = 10;
  print("$number");

  //String Datatype
  String firstName = "Maha";
  String lastName = "Lakshmi";
  print("The Name is :$firstName" + "$lastName");

  //Type Conversion
  String number1 = "1";
  print("The $number1 is converted to  type ${number1.runtimeType}");
  int convertedNumber = int.parse(number1);
  print(convertedNumber);
  print(
      "The $convertedNumber is converted to type ${convertedNumber.runtimeType}");
  String convertedString = convertedNumber.toString();
  print(convertedString);
  print(
      "The $convertedString is converted to type ${convertedString.runtimeType}");

  //Boolean Datatype
  bool isEligible = true;
  print("Eligible Status: $isEligible");

  //Lists Datatype
  List<String> studentNames = ["Mahalakshmi", "Piriya", "Archana"];
  print(studentNames);
  print("The Name of the First Student:" + studentNames[0]);

  int length = studentNames.length;
  print(length);

  //Sets Datatype
  Set<String> animals = {"Cat", "Dog", "Elephant"};
  print(animals);

  //Maps Datatype
  Map<int, String> teamMembers = {1: "Mahalakshmi", 2: "Piriya", 3: "Archana"};
  print(teamMembers);
  print(teamMembers[1]);

  //Runes Datatype
  String value = "a";
  print(value.runes);
}
