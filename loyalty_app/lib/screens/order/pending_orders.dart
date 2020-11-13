import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  static const routeName = '/pending-orders';

  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Orders'),
      ),
    );
  }
}
