import 'package:flutter/material.dart';

class ShoppingList with ChangeNotifier {
  String id;
  String title;

  ShoppingList({
    @required this.id,
    @required this.title,
  });
}
