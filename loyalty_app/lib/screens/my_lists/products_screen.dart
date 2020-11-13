import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/providers/product.dart';
import 'package:shop_ke/providers/products.dart';
import 'package:shop_ke/providers/shopping_lists.dart';
import 'package:shop_ke/screens/my_lists/products_screen_list_view.dart';
import 'package:shop_ke/widget_components/my_lists/no_items_image.dart';
import 'package:shop_ke/widget_components/my_lists/search_products_text_field.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/shopping-list-items';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  static bool isAddingItem = false;

  //static List<Product> products = [];
  final url = 'http://jsonplaceholder.typicode.com/users';
  static List<Product> _products;

  @override
  void initState() {
    super.initState();
    setProducts(context);
  }

  void setProducts(BuildContext context) async {
    print('Here');
    String productsJson = await DefaultAssetBundle.of(context)
        .loadString('assets/dummy_data/dummy_inventory.json');
    final parsed = json.decode(productsJson).cast<Map<String, dynamic>>();
    _products = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    print(_products.length);
  }


  @override
  Widget build(BuildContext context) {
    //Get the id of the shopping list from the route argument use it to get the shopping list attributes
    final shoppingListId = ModalRoute.of(context).settings.arguments as String;
    final shoppingList = Provider.of<ShoppingLists>(context).findById(
        shoppingListId);

    //Get info about the products in the shopping chosen
    final products = Provider.of<Products>(context);
    final productsList = products.productsList[shoppingListId];

    //Text field on the app bar
    final icon = isAddingItem
        ? Icons.clear
        : Icons.add; //Icon appended to text field on app bar

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigate to previous page
              Navigator.of(context).pop();
              //Return screen to default view
              if (isAddingItem) toggleDisplayTextField();
            }),
        title: isAddingItem
            ? SearchProductsTextField(
            shoppingListId: shoppingListId, products: _products)
            : Text(shoppingList.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(icon),
            onPressed: () => toggleDisplayTextField(),
          ),
        ],
      ),
      body: productsList.length > 0
          ? ProductsScreenListView(shoppingListId)
          : NoItemsImage(),
      floatingActionButton: RaisedButton(child: Text(
        'CHECKOUT WITH TOTAL OF ${products.productsTotal.toStringAsFixed(2)}',
        //Display the price total to 2dp
        style: TextStyle(color: Theme
            .of(context)
            .backgroundColor),), onPressed: () {}, color: Theme
          .of(context)
          .accentColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void toggleDisplayTextField() {
    setState(() {
      isAddingItem = !isAddingItem;
    });
  }

//  TextField _textField(BuildContext context) {
//    return TextField(
//      decoration: InputDecoration(
//        hintText: 'New list item',
//        hintStyle: TextStyle(color: Theme.of(context).backgroundColor),
//        border: UnderlineInputBorder(
//          borderSide: BorderSide(color: Theme.of(context).backgroundColor),
//        ),
//      ),
//      style: TextStyle(color: Theme.of(context).backgroundColor),
//      cursorColor: Theme.of(context).backgroundColor,
//      autofocus: true,
//    );
//  }

}
