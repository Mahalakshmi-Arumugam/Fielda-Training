void main(){

  //Creating a List

  List<int>num = [1,2,3,4];
  print(num);

  //Accessing Elements
  print(num[0]);

  //Adding the Element
  num.add(6);
  print(num);

  //Inserting the Element
  num.insert(4, 5);
  print(num);

  //Removing elements
  num.remove(4);
  print(num);

  //Removing by index
  num.removeAt(0);
  print(num);

  //List Methods
  List<int>value =[9,4,3,5,6];
  value.sort();
  print(value);
}