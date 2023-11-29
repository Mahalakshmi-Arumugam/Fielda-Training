void main() {
  //String Concatenation

  String firstName = "Mahalakshmi";
  String lastName = "Arumugam";
  print("Full Name is " + firstName + " " + lastName + ".");
  print("Full name is $firstName $lastName.");

  //Properties of String
  String greetings = "Hello\t ";
  print(greetings.codeUnits);
  print(greetings.isEmpty);
  print(greetings.isNotEmpty);
  print(greetings.length);

  //Methods in String
  String domain = "Product Engineering";
  print(domain.toUpperCase());
  print(domain.toLowerCase());

  String Location = " Chennai";
  print(Location.trim());
  print("The Location is ${Location.trimLeft()}");

  String Position = "Intern   ";
  print('The Position is ${Position.trimRight()} for now ');

  String choice1 = "Chennai";
  String choice2 = "Coimbatore";
  String choice3 = "Maharastra";
  print(choice3.compareTo(choice2));
  print(choice3.compareTo(choice1));
  print(choice1.compareTo(choice3));

  String old = "I like milk";
  String replace = old.replaceAll('milk', 'juice');
  print("The replaced string is $replace");
  print("The old string is $old");

  String allNames = "Ram, Hari, Shyam, Gopal";

  List<String> listNames = allNames.split(",");
  for (String name in listNames) {
    print(name);
  }

  String myName = "Mahalakshmi";
  print("SubString ${myName.substring(6)}");
  print("SubString ${myName.substring(2, 6)}");

  String input = "Hello World";
  List<String> splitInput = input.split(' ');
  List<String> reversedInput = splitInput.reversed.toList();
  String finalInput = reversedInput.join();
  print(finalInput);

  String input2 = "Hello";
  print("$input Reverse is ${input2.split('').reversed.join()}");

  String text = "hello world";
  print(
      "Capitalized first letter of String: ${text[0].toUpperCase()}${text.substring(1)}");

  String country = "India,Australia,Pakisthan";
  print(country.contains('India'));
  print(country.indexOf('India'));
}
