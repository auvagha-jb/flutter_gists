import 'package:flutter/material.dart';
import 'package:shop_ke/screens/app_wrapper.dart';
import 'package:shop_ke/screens/authentication/sign_in_screen.dart';
import 'package:shop_ke/screens/authentication/sign_up_screen.dart';
import 'package:shop_ke/screens/main/website.dart';
import 'package:shop_ke/screens/my_lists/products_screen.dart';
import 'package:shop_ke/screens/my_lists/shopping_lists_screen.dart';
import 'package:shop_ke/screens/my_profile/change_password_screen.dart';
import 'package:shop_ke/screens/my_profile/edit_details_screen.dart';
import 'package:shop_ke/screens/my_profile/profile_details_screen.dart';
import 'package:shop_ke/screens/order/delivered_orders.dart';
import 'package:shop_ke/screens/order/my_addresses.dart';
import 'package:shop_ke/screens/order/new_order.dart';
import 'package:shop_ke/screens/order/order.dart';
import 'package:shop_ke/screens/order/pending_orders.dart';
import 'package:shop_ke/screens/pay_bill/pay_bill.dart';
import 'package:shop_ke/screens/pay_bill/receipts.dart';
import 'package:shop_ke/screens/promotions/promotions.dart';

class Routes {
  static Map getRoutes(context) {
    return <String, WidgetBuilder>{
      //Startup screen
      '/': (context) => AppWrapper(),

      //Authentication screens
      SignInScreen.routeName: (context) => SignInScreen(),
      SignUpScreen.routeName: (context) => SignUpScreen(),

      //My list screens
      ShoppingListsScreen.routeName: (context) => ShoppingListsScreen(),
      ProductsScreen.routeName: (context) => ProductsScreen(),
      Website.routeName: (context) => Website(),

      //My Profile
      ProfileDetails.routeName: (context) => ProfileDetails(),
      EditDetailsScreen.routeName: (context) => EditDetailsScreen(),
      ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),

      //Promotions
      PromotionsScreen.routeName: (context) => PromotionsScreen(),

      //Orders
      Order.routeName: (context) => Order(),
      NewOrder.routeName: (context) => NewOrder(),
      PendingOrders.routeName: (context) => PendingOrders(),
      DeliveredOrders.routeName: (context) => DeliveredOrders(),
      MyAddresses.routeName: (context) => MyAddresses(),

      //Pay Bill
      PayBill.routeName: (context) => PayBill(),
      Receipts.routeName: (context) => Receipts()
    };
  }
}
