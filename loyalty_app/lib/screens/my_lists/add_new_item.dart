import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  final shoppingListId;

  AddNewItem(this.shoppingListId);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  double borderRadius = 20.0;
  final textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Form(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: textInputController,
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'New Shopping Item'),
                  ),
                ),

                //Submit button
                RaisedButton(
                  color: Theme
                      .of(context)
                      .accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  child: Icon(Icons.send, color: Theme
                      .of(context)
                      .backgroundColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
