import 'package:flutter/material.dart';
import 'package:shop_ke/screens/authentication/sign_in_screen.dart';
import 'package:shop_ke/screens/authentication/sign_up_screen.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Theme.of(context).primaryColor,
      //margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text(
              'Register now to enjoy BIG SAVINGS AND REWARDS',
              style: TextStyle(fontSize: 18, color: Theme
                  .of(context)
                  .backgroundColor),
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: ButtonRow()),
        ],
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text('LOGIN'),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(SignInScreen.routeName);
          },
        ),
        SizedBox(width: 8),
        RaisedButton(
          child: Text(
            'SIGN UP',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
