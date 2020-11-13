import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/providers/product.dart';
import 'package:shop_ke/providers/products.dart';
import 'package:shop_ke/widget_components/ui/card_tile.dart';
import 'package:shop_ke/widget_components/ui/circle_network_image.dart';

class ProductTile extends StatefulWidget {
  final int index;
  final String shoppingListId;

  ProductTile(this.index, this.shoppingListId);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    print(Navigator.of(context));

    return InkWell(
      //To enable tap interactions
      onTap: () {}, //product.changeEnabledStatus(product.isEnabled);
      child: CardTile(
        child: CardContent(product: product,
            index: widget.index,
            shoppingListId: widget.shoppingListId),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    Key key,
    @required this.product,
    @required this.index,
    @required this.shoppingListId,
  }) : super(key: key);

  final Product product;
  final int index;
  final shoppingListId;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              //Safety check to avoid zero and negative quantities
              if (product.quantity > 1) {
                product.decrementQuantity();
                products.decreaseProductsTotal(product.price);
              } else {
                products.deleteProduct(shoppingListId: shoppingListId,
                    productId: product.id,
                    index: index);

                products.onDeleteProduct(
                  context,
                  index: index,
                  product: product,
                  products: products,
                  shoppingListId: shoppingListId,
                );
              }
            },
          ),
          CircleNetworkImage(product.imageUrl),
          SizedBox(width: 10),
          Expanded(flex: 4, child: Text('${product.brand} ${product.name}')),
          ResponsiveContainer(
            height: 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${product.price}'),
                Text('x ${product.quantity}'),
                Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                  ),
                  child: Text(
                    '${product.subtotal.toStringAsFixed(2)}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              product.incrementQuantity();
              products.increaseProductsTotal(product.price);
            },
            color: Theme
                .of(context)
                .accentColor,
          ),
        ],
      ),
    );
  }
}
