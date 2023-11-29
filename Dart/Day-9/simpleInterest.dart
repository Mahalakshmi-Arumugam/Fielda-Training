/*create class SimpleInterest with three properties: principal, rate, and time.
 The class also has a method called interest, which calculates the simple interest.*/

 class SimpleInterest{
  double? principal;
  double? rate;
  double? time;

  void interest(){
    double? interest=((principal!*rate!*time!)/100);
    print("The interest is :$interest");
  }
 }

 void main(){
  SimpleInterest simpleInterest=SimpleInterest();
  simpleInterest.principal=5000;
  simpleInterest.rate=3;
  simpleInterest.time=3;
  simpleInterest.interest();
 }