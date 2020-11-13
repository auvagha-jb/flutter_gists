import 'package:flutter/material.dart';
import 'package:shop_ke/data/dummy_shopping_lists.dart';
import 'package:shop_ke/models/feedback.dart';
import 'package:shop_ke/providers/shopping_list.dart';

class ShoppingLists with ChangeNotifier {
  List<ShoppingList> _shoppingLists = DummyShoppingLists.shoppingList;

  List<ShoppingList> get shoppingLists {
    return [..._shoppingLists];
  }

  findById(String id) {
    return _shoppingLists.firstWhere((shoppingList) => shoppingList.id == id);
  }

  AppFeedback addShoppingList(BuildContext context, String title) {
    final shoppingListId = DateTime.now().toString();
    try {
      print('Adding shopping list');
      //Add the shopping list
      _shoppingLists.add(ShoppingList(
        id: shoppingListId,
        title: title,
      ));

      //Close the input dialog
      Navigator.of(context).pop();

      notifyListeners();

      //Return the success message
      return AppFeedback(
          message: 'List added successfully', status: true, id: shoppingListId);
    } on Exception catch (e) {
      print(e);
      //Return unsuccessful message
      return AppFeedback(message: 'Something went wrong', status: false);
    }
  }

}
