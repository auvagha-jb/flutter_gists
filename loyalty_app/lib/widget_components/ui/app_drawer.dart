import 'package:flutter/material.dart';
import 'package:shop_ke/screens/main/website.dart';
import 'package:shop_ke/screens/my_profile/profile_details_screen.dart';

import '../../screens/my_lists/shopping_lists_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            //Drawer Title
            Container(
              alignment: Alignment.centerLeft,
              color: Theme
                  .of(context)
                  .primaryColor,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'Loyalty App',
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .backgroundColor, fontSize: 24),
              ),
            ),

            //Drawer Items

            //My Profile
            ListTile(
              title: const Text('My profile'),
              leading: Icon(Icons.account_circle),
              onTap: () {
                Navigator.pushNamed(context, ProfileDetails.routeName);
              },
            ),

            Divider(),

            //My Lists
            ListTile(
              title: const Text('My Lists'),
              leading: Icon(Icons.list),
              onTap: () {
                Navigator.pushNamed(context, ShoppingListsScreen.routeName);
              },
            ),


            //Website
            ListTile(
              title: const Text('Promotions'),
              leading: Icon(Icons.local_offer),
              onTap: () {
                Navigator.pushNamed(context, Website.routeName);
              },
            ),


            ListTile(
              title: const Text('My Orders'),
              leading: Icon(Icons.drive_eta),
              onTap: () {
                Navigator.pushNamed(context, Website.routeName);
              },
            ),

          ],
        ),
      ),
    );
  }
}
