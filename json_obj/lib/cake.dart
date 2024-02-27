class Cake {
  final int id;
  final String cakeName;
  final double actualPrice;
  final double price;
  final String quantity;

  Cake({
    required this.id,
    required this.cakeName,
    required this.actualPrice,
    required this.price,
    required this.quantity,
  });

  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
      id: json['id'],
      cakeName: json['cake name'],
      actualPrice: json['Actual price'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
