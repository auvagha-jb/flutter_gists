import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTapAction;

  const HomeCard(
      {@required this.title, @required this.icon, @required this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return InkWell( //To register taps
      onTap: onTapAction,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: GridTile(
            child: Icon(
              icon,
              color: Theme
                  .of(context)
                  .primaryColor,
              size: 30,
            ),
            footer: Text(title, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
