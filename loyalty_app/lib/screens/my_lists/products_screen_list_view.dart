import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/providers/products.dart';
import 'package:shop_ke/widget_components/my_lists/product_tile.dart';

class ProductsScreenListView extends StatelessWidget {
  final String shoppingListId;

  ProductsScreenListView(this.shoppingListId);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    //Get the shopping list items where the shopping list matches the id passed
    final productsList = products.productsList[shoppingListId];

    return ListView.builder(
      itemCount: productsList.length,
      itemBuilder: (ctx, index) {
        final product = productsList[index];
        final deleteText = Text(
          'Delete',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        );

        //ListView Items
        return ChangeNotifierProvider.value(
          value: product,
          //The Dismissible wrapper
          child: Dismissible(
            key: Key(product.id),
            background: Container(
              color: Theme.of(context).accentColor,
              child: ListTile(
                trailing: deleteText,
              ),
            ),

            //Action to be taken once the tile has been dismissed
            onDismissed: (direction) {
              products.deleteProduct(
                index: index,
                shoppingListId: shoppingListId,
                productId: product.id,
              );

              products.onDeleteProduct(
                ctx,
                index: index,
                product: product,
                products: products,
                shoppingListId: shoppingListId,
              );
            },
            child: ProductTile(index, shoppingListId),
          ),
        );
      },
    );
  }
}
