/*Create a class Camera with properties: name, color, megapixel. 
Create a method called display which prints out the values of the three properties.
 Create two objects of the class Camera and call the method display.*/

 class Camera{
  String? name;
  String? color;
  String? megapixel;

  void display(){
  print("The name of the car is:$name");
  print("The color of the car is:$color");
  print("The megapixel of the car is:$megapixel");
 }
 }

 void main(){
  Camera camera1=Camera();
  camera1.name="DSLR";
  camera1.color="Black";
  camera1.megapixel="60DA";
  camera1.display();

  Camera camera2=Camera();
  camera2.name="Google Camera";
  camera2.color="Blue";
  camera2.megapixel="100DA";
  camera2.display();

 }

 