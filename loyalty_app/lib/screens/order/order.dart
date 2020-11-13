import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/screens/order/delivered_orders.dart';
import 'package:shop_ke/screens/order/new_order.dart';
import 'package:shop_ke/screens/order/pending_orders.dart';
import 'package:shop_ke/widget_components/orders/order_menu_item.dart';

class Order extends StatefulWidget {
  static const routeName = '/order';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Map<String, dynamic>> getMenuList(BuildContext context) {
    return [
      {
        'icon': Icons.shopping_cart,
        'title': 'New order',
        'color': Theme.of(context).primaryColor,
//        'routeName': ShoppingListsScreen.routeName,
        'routeName': NewOrder.routeName,
      },
      {
        'icon': Icons.format_list_bulleted,
        'title': 'Order from shopping list',
        'color': Theme
            .of(context)
            .accentColor,
        'routeName': DeliveredOrders.routeName,
      },
      {
        'icon': Icons.local_shipping,
        'title': 'Pending orders',
        'color': Theme.of(context).accentColor,
        'routeName': PendingOrders.routeName,
      },
      {
        'icon': Icons.receipt,
        'title': 'Delivered',
        'color': Theme
            .of(context)
            .primaryColor,
        'routeName': DeliveredOrders.routeName,
      },
    ];
  }

  getMenuCards(BuildContext context) {
    return getMenuList(context).map((item) =>
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: menuCard(item)));
  }

  menuCard(Map<String, dynamic> item) {
    return ResponsiveContainer(
        child: OrderMenuItem(
          icon: item['icon'],
          title: item['title'],
          color: item['color'],
          routeName: item['routeName'],
        ),
        height: 0.20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        child: Column(
          children: <Widget>[
            ResponsiveContainer(
              height: 0.05,
              child: Center(child: Text('Location goes here')),
            ),
            ResponsiveContainer(
              height: 0.75,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: getMenuList(context)
                    .map((item) =>
                    OrderMenuItem(
                      icon: item['icon'],
                      title: item['title'],
                      color: item['color'],
                      routeName: item['routeName'],
                    ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
