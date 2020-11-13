import 'package:flutter/material.dart';

class CardWIthIcon extends StatelessWidget {
  const CardWIthIcon({
    Key key,
    @required this.icon,
    @required this.title,
    this.color = Colors.white,
    this.iconColor,
    this.textColor,
    this.fontSize = 18,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(3.0),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                      color: color,
                      child: Icon(
                        icon,
                        color: iconColor == null
                            ? Theme.of(context).backgroundColor
                            : iconColor,
                        size: 50,
                      ),
                      onPressed: () {}),
                )),
            SizedBox(height: 10),
            Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor == null ? Colors.black : textColor,
                  ),
                )),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
