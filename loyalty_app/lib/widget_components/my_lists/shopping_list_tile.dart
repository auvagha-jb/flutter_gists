import 'package:flutter/material.dart';
import 'package:shop_ke/screens/my_lists/products_screen.dart';
import 'package:shop_ke/widget_components/ui/card_tile.dart';

class ShoppingListTile extends StatelessWidget {
  final title;
  final id;

  ShoppingListTile({@required this.id, @required this.title});

  goToShoppingListItems(BuildContext context, String id) {
    Navigator.pushNamed(context, ProductsScreen.routeName,
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return CardTile(
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => goToShoppingListItems(context, id),
      ),
    );
  }
}
