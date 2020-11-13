import 'package:flutter/material.dart';
import 'package:shop_ke/screens/my_lists/shopping_list_screen_list_view.dart';
import 'package:shop_ke/widget_components/my_lists/input_dialog.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingListsScreen extends StatefulWidget {
  static const routeName = '/shopping-lists';

  @override
  _ShoppingListsScreenState createState() => _ShoppingListsScreenState();
}

class _ShoppingListsScreenState extends State<ShoppingListsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showInputDialog(BuildContext context,
      GlobalKey<ScaffoldState>scaffoldKey) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return InputDialog(title: 'Create new shopping list',
            hintText: 'New List Title',
            scaffoldKey: scaffoldKey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Lists'),
      ),
      body: ShoppingListScreenListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Dialog box rising');
          //Firestore.instance.collection('chats');
          _showInputDialog(context, _scaffoldKey);
        },
      ),

    );
  }
}
