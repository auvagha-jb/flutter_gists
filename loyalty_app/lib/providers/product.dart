import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {

  final String id;
  final String name;
  final double price;
  final String brand;
  final String imageUrl;
  int quantity;
  double subtotal;

  bool isChecked = false;
  bool isEnabled = false;

  Product({@required this.id,
    @required this.name,
    @required this.price,
    @required this.brand,
    this.quantity,
    this.imageUrl,
    this.subtotal,
  });

  void changeCheckedStatus(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void changeEnabledStatus(bool value) {
    isEnabled = !isEnabled;
    notifyListeners();
  }

  void incrementQuantity() {
    quantity++;
    subtotal = quantity * price;
    notifyListeners();
  }

  void decrementQuantity() {
    quantity--;
    subtotal = quantity * price;
    notifyListeners();
  }

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      id: parsedJson['id'] as String,
      name: parsedJson['name'] as String,
      brand: parsedJson['brand'] as String,
      price: parsedJson['price'] as double,
      imageUrl: parsedJson['imageUrl'] as String,
    );
  }

}
