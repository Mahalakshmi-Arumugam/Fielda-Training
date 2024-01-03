class SimpleInterest {
  double principal = 0;
  double? rate;
  double? time;

  void interestWithParameters(
      {double? principal, required double rate, required double time}) {
    double calculatedInterest = ((principal! * rate * time) / 100);
    print("The interest with parameters is: $calculatedInterest");
  }
}

void main() {
  SimpleInterest simpleInterest = SimpleInterest();
  simpleInterest.interestWithParameters( principal: null, rate: 3, time: 3);
}
