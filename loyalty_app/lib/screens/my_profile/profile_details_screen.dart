import 'package:flutter/material.dart';
import 'package:shop_ke/screens/my_profile/edit_details_screen.dart';

class ProfileDetails extends StatefulWidget {
  static const routeName = '/profile-details';

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Profile Details card
            Card(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: ListTile(
                  leading: Icon(Icons.person, size: 50),
                  title: Text('Jerry Auvagha'),
                  subtitle: Text('jerry.auvagha@gmail.com'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, size: 25),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(EditDetailsScreen.routeName),
                  ),
                ),
              ),
            ),

            //Change password tile
            Card(
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next, size: 25),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
