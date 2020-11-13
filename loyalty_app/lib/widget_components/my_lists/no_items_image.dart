import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';

class NoItemsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveContainer(
        height: 0.5,
        child: Image.asset('assets/images/empty-list.png', fit: BoxFit.fill),
      ),
    );
  }
}
