import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:shop_ke/constants.dart';

class PayBill extends StatefulWidget {
  static const routeName = '/pay-bill';

  @override
  _PayBillState createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  final phoneNumberController = TextEditingController();

  Future<dynamic> startCheckout({
    @required String userPhoneNumber,
    @required double amount,
  }) async {
    final uri = Uri.parse('https://sandbox.safaricom.co.ke');
    dynamic transactionInit;
    try {
      transactionInit = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: Constants.BUSINESS_SHORT_CODE,
        transactionType: TransactionType.CustomerPayBillOnline,
        amount: null,
        partyA: userPhoneNumber,
        partyB: Constants.PARTY_B,
        callBackURL: uri,
        accountReference: 'Loyalty App',
        phoneNumber: userPhoneNumber,
        baseUri: uri,
        //Sandbox URI
        passKey: Constants.PASS_KEY,
      );
      print(transactionInit);
      return transactionInit;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextField()),
    );
  }
}
