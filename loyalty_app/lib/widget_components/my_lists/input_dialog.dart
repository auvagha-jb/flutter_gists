import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/providers/products.dart';
import 'package:shop_ke/providers/shopping_lists.dart';

class InputDialog extends StatefulWidget {
  final String hintText;
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;

  InputDialog(
      {@required this.title, @required this.hintText, @required this.scaffoldKey});

  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _inputController = TextEditingController();
  bool _hasTitle = true;

  void _showSnackBar(String scaffoldText) {
    final snackBar = SnackBar(
      content: Text(scaffoldText),
    );
    widget.scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final shoppingListsProvider = Provider.of<ShoppingLists>(context);
    final productsProvider = Provider.of<Products>(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text(widget.title),
      content: TextField(
        controller: _inputController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: _hasTitle ? null : 'Title Can\'t Be Empty',
        ),
      ),
      actions: <Widget>[
        //Cancel button
        FlatButton(
          child: new Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        //The submit button
        RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text('CREATE'),
          onPressed: () {
            setState(() {
              _hasTitle = _inputController.text.isEmpty ? false : true;
              print(_hasTitle);
            });

            if (_hasTitle) {
              //Add new list
              final feedback = shoppingListsProvider.addShoppingList(
                  context, _inputController.text);

              //Add the key to the shopping list items map
              if (feedback.status) {
                productsProvider.addEmptyList(feedback.id);
              }

              //Display snackBar message
              _showSnackBar(feedback.message);
            }
          },
        )
      ],
    );
  }
}
