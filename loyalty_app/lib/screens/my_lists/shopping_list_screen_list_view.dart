import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/providers/shopping_lists.dart';
import 'package:shop_ke/widget_components/my_lists/shopping_list_tile.dart';

class ShoppingListScreenListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingListData = Provider.of<ShoppingLists>(context);
    final shoppingLists = shoppingListData.shoppingLists;

    return ListView.builder(
      itemCount: shoppingLists.length,
      itemBuilder: (context, index) {
        return ShoppingListTile(
          id: shoppingLists[index].id,
          title: shoppingLists[index].title,
        );
      },
    );
  }
}
