void main() {
  Set<int> Numbers = {1, 2, 3, 4, 5};
  print(Numbers);

  //Check The Available Value in sets
  print(Numbers.contains(2));

  //Methods in Sets

  //Clear Set In Dart
  Set<String> fruits = {"Apple", "Orange", "Mango"};
  fruits.clear();
  print(fruits);

  //Difference In Set
  Set<String> fruits1 = {"Apple", "Orange", "Mango"};
  Set<String> fruits2 = {"Apple", "Grapes", "Banana"};
  final differenceSet = fruits1.difference(fruits2);
  final differenceSet1 = fruits2.difference(fruits1);
  print(differenceSet);
  print(differenceSet1);

  //Element At Method In Dart
  Set<String> days = {"Sunday", "Monday", "Tuesday"};
  print(days.elementAt(2));

  //Intersection Method In Dart
  Set<String> fruits3 = {"Apple", "Orange", "Mango"};
  Set<String> fruits4 = {"Apple", "Grapes", "Banana"};

  final intersectionSet = fruits3.intersection(fruits4);

  print(intersectionSet);
}
