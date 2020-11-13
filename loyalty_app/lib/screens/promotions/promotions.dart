import 'package:flutter/material.dart';

class PromotionsScreen extends StatefulWidget {
  static const routeName = '/promotions';

  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Offers'),
      ),
    );
  }
}
