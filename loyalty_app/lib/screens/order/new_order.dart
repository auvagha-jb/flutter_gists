import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/screens/my_lists/add_new_item.dart';
import 'package:shop_ke/widget_components/orders/order_map.dart';

class NewOrder extends StatefulWidget {
  static const routeName = '/new-order';

  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final _appBar = AppBar(title: Text('New Order'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: <Widget>[
              ResponsiveContainer(
                height: 0.5,
                child: OrderMap(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.local_convenience_store),
          onPressed: () => _showAddNewTransaction(context, 'm1'),
        ));
  }

  _showAddNewTransaction(BuildContext ctx, String shoppingListId) {
    return showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewItem(shoppingListId),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
