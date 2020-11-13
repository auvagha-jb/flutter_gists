import 'package:flutter/material.dart';
import 'package:shop_ke/widget_components/ui/card_with_icon.dart';

class ContactImmediatelyRow extends StatelessWidget {
  static const gridItems = [
    {'title': 'Contact our support', 'icon': Icons.phone},
    {'title': 'Send us an email', 'icon': Icons.email},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          ...gridItems
              .map((gridItem) =>
              Expanded(
                child: CardWIthIcon(
                  title: gridItem['title'],
                  icon: gridItem['icon'],
                  iconColor: Theme
                      .of(context)
                      .primaryColor,
                  textColor: Theme
                      .of(context)
                      .primaryColor,
                ),
              ))
              .toList()
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const GridItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Card(
        child: GridTile(
          header: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          child: Text(title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
