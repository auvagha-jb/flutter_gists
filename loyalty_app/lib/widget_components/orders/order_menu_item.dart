import 'package:flutter/material.dart';
import 'package:shop_ke/widget_components/ui/card_with_icon.dart';

class OrderMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String routeName;

  OrderMenuItem(
      {@required this.icon,
      @required this.title,
        this.color,
      @required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(routeName),
      child: CardWIthIcon(color: color, icon: icon, title: title),
    );
  }
}


//Padding(
//            padding: EdgeInsets.all(20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                Row(children: <Widget>[
//                  Icon(Icons.schedule),
//                  SizedBox(width: 6),
//                  Text('$duration min'),
//                ]),
//                Row(children: <Widget>[
//                  Icon(Icons.work),
//                  SizedBox(width: 6),
//                  Text(complexityText),
//                ]),
//                Row(children: <Widget>[
//                  Icon(Icons.attach_money),
//                  SizedBox(width: 6),
//                  Text(affordabilityText),
//                ]),
//              ],
//            ),
//          ),
