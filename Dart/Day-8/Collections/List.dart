void main() {
  //Fixed length list
  var fixedLengthList = List<int>.filled(3, 2);
  print(fixedLengthList);

  //Growable list
  List<int> growableList = [1, 2, 3, 4, 5, 6];
  print(growableList);

  //Access the ite of the List
  print(growableList[1]);

  //Get Index By Value
  print(growableList.indexOf(3));

  //The Length Of The List
  print(growableList.length);

  //Changing Values Of List
  growableList[1] = 8;
  print(growableList);

  //properties of List
  //Access First And Last Elements Of List
  print("${growableList.first} and ${growableList.last} ");

  //Check The List Is Empty Or Not
  print("Is the growableList is empty?:${growableList.isEmpty.toString()}");
  print("Is the growableList is empty?:${growableList.isNotEmpty.toString()}");

  //Reverse List In Dart
  print("The reversed list is :${growableList.reversed}");

  //Adding Item To List
  growableList.add(10);
  print(growableList);

  growableList.addAll([12, 13, 14]);
  print(growableList);

  growableList.insert(2, 20);
  print(growableList);

  growableList.insertAll(1, [8, 10, 3, 4]);
  print(growableList);

  //Replace range of List
  growableList.replaceRange(0, 3, [12, 89, 91]);
  print(growableList);

  //Removing List Elements
  List<int> removeList = [1, 2, 3, 4, 5];
  print(removeList);

  removeList.remove(2);
  print(removeList);

  removeList.removeAt(0);
  print(removeList);

  removeList.removeLast();
  print(removeList);

  List<int> removeList1 = [1, 2, 3, 4, 5];
  removeList1.removeRange(0, 4);
  print(removeList1);

  //Loops in list
  List<String> Names = ["Maha", "Arumugam", "Vennila"];
  Names.forEach((n) => print(n));

  //Multiply All Value By 2 Of All List
  List<int> Num = [1, 2, 3, 4];
  Num.forEach((n) => print(n * 2));

  //Combine Two Or More List In Dart
  List<int> num1 = [1, 2, 3];
  List<int> num2 = [4, 5, 6];
  List<int> num = [...num1, ...num2];
  print(num);

  //Condition in List
  bool sad = false;
  var cart = ['milk', 'ghee', if (sad) 'Water'];
  print(cart);
  bool happy = true;
  var cart2 = ['milk', 'ghee', if (happy) 'Water'];
  print(cart2);

  //Where In List Dart
  List<int> Numbers = [1, 2, 3, 4, 5, 6];
  var even = Numbers.where((Number) => Number.isEven).toList();
  print(even);
}
