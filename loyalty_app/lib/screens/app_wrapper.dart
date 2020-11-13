import 'package:flutter/material.dart';
import 'package:shop_ke/screens/order/order.dart';

import './main/find_store.dart';
import './main/home.dart';
import '../widget_components/ui/app_drawer.dart';
import 'authentication/auth_screen.dart';
import 'main/contact_us.dart';

class AppWrapper extends StatefulWidget {
  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _selectedPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final _pageOptions = [
    {'page': Home(), 'title': 'Loyalty App'},
    {'page': Order(), 'title': 'Place an Order'},
    {'page': FindStore(), 'title': 'Stores'},
    {'page': ContactUs(), 'title': 'Contact us'},
  ];

  void _switchScreen(index) {
    setState(() => _selectedPageIndex = index);
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text(
          _pageOptions[_selectedPageIndex]['title'],
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.grey[50],
      ),
      body: _pageOptions[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _switchScreen(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Order'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text('Find a store'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Contact us'),
          ),
        ],
      ),
    );
  }
}
