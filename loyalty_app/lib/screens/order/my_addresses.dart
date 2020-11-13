import 'package:flutter/material.dart';

class MyAddresses extends StatefulWidget {
  static const routeName = '/my-addresses';

  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Addresses'),
      ),
    );
  }
}
