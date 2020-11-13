import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:provider/provider.dart';
import 'package:shop_ke/helpers/routes.dart';
import 'package:shop_ke/providers/products.dart';
import 'package:shop_ke/providers/shopping_lists.dart';

import 'constants.dart';
import 'screens/app_wrapper.dart';

void main() {
  runApp(MyApp());
  MpesaFlutterPlugin.setConsumerKey(Constants.CONSUMER_KEY);
  MpesaFlutterPlugin.setConsumerSecret(Constants.CONSUMER_SECRET);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ShoppingLists()),
        ChangeNotifierProvider(create: (ctx) => Products()),
      ],
      child: MaterialApp(
        title: "LoyaltyApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[900],
          accentColor: Colors.red[400],
          backgroundColor: Colors.grey[200],
          textTheme: TextTheme(
              headline6: TextStyle(fontWeight: FontWeight.bold)),
        ),
        routes: Routes.getRoutes(context),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => AppWrapper(),
          );
        },
      ),
    );
  }
}
