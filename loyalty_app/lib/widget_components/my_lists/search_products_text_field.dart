import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/providers/product.dart';
import 'package:shop_ke/providers/products.dart';

class SearchProductsTextField extends StatefulWidget {
  final shoppingListId;
  final List<Product> products;

  SearchProductsTextField(
      {@required this.shoppingListId, @required this.products})
      : assert(products != null);

  @override
  _SearchProductsTextFieldState createState() =>
      _SearchProductsTextFieldState();
}

class _SearchProductsTextFieldState extends State<SearchProductsTextField> {
  final _key = GlobalKey<AutoCompleteTextFieldState<Product>>();

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    return AutoCompleteTextField<Product>(
      key: _key,
      suggestions: widget.products,
      itemFilter: (item, query) =>
          item.name.toLowerCase().startsWith(query.toLowerCase()),
      itemSorter: (first, second) => first.name.compareTo(second.name),
      itemSubmitted: (Product product) => productsProvider.addProduct(
          product: product, shoppingListId: widget.shoppingListId),
      itemBuilder: (context, Product product) => SuggestionsRow(product),
      decoration: InputDecoration(
        hintText: 'New list item',
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class SuggestionsRow extends StatelessWidget {
  final Product product;

  SuggestionsRow(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text(product.name)),
        ],
      ),
    );
  }
}
