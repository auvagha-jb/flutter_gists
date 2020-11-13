import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/widget_components/contact_us/contact_immediately_row.dart';

class ContactUs extends StatelessWidget {
  Map<String, double> getHeights(BuildContext context) {
    double contactImmediatelyHeight = 0.3;

    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      contactImmediatelyHeight = 0.4;
    }

    return {
      'contactImmediatelyHeight': contactImmediatelyHeight
    };
  }

  @override
  Widget build(BuildContext context) {
    final heights = getHeights(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //GridView for contact by email and phone
          ResponsiveContainer(
            height: heights['contactImmediatelyHeight'],
            child: ContactImmediatelyRow(),
          ),
        ],
      ),
    );
  }
}
