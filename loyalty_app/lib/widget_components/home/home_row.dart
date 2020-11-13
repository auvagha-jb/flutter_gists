import 'package:flutter/material.dart';
import 'package:shop_ke/screens/pay_bill/pay_bill.dart';
import 'package:shop_ke/screens/pay_bill/receipts.dart';
import 'package:shop_ke/screens/promotions/promotions.dart';
import 'package:shop_ke/widget_components/home/home_card.dart';

class HomeRow extends StatelessWidget {
  static const gridItems = [
    {'title': 'Pay Bill', 'icon': Icons.payment, 'route': PayBill.routeName},
    {
      'title': 'My Receipts',
      'icon': Icons.receipt,
      'route': Receipts.routeName
    },
    {
      'title': 'Promotions',
      'icon': Icons.local_offer,
      'route': PromotionsScreen.routeName
    },
  ];

//  void navigateToScreen(BuildContext context, String routeName) {
//    Navigator.of(context).pushNamed(routeName);
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 8, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          ...gridItems
              .map(
                (gridItem) =>
                Expanded(
                  child: HomeCard(
                    title: gridItem['title'],
                    icon: gridItem['icon'],
                    onTapAction: () {
                      Navigator.of(context).pushNamed(gridItem['route']);
                    },
                  ),
                ),
          )
              .toList(),
        ],
      ),
    );
  }
}
