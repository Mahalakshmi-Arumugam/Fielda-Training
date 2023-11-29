enum EnumofYear {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

void main() {
  print(EnumofYear.values);
  EnumofYear.values.forEach((v) => print('value: $v, index: ${v.index}'));

  //we can also use for loop for this
  for (var v in EnumofYear.values) {
    print('value: $v, index: ${v.index}');
  }
}
