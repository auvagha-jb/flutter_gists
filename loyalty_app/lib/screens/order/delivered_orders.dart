import 'package:flutter/material.dart';

class DeliveredOrders extends StatefulWidget {
  static const routeName = '/delivered-orders';

  @override
  _DeliveredOrdersState createState() => _DeliveredOrdersState();
}

class _DeliveredOrdersState extends State<DeliveredOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivered'),
      ),
    );
  }
}
