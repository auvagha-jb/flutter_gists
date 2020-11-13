import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/widget_components/home/home_banner.dart';
import 'package:shop_ke/widget_components/home/home_carousel_slider.dart';
import 'package:shop_ke/widget_components/home/home_row.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, double> getHeights(BuildContext context) {
    double bannerHeight = 0.2;
    double carouselHeight = 0.3;
    double gridHeight = 0.2;

    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      carouselHeight = 0.6;
      gridHeight = 0.4;
    }

    return {
      'bannerHeight': bannerHeight,
      'carouselHeight': carouselHeight,
      'gridHeight': gridHeight,
    };
  }

  @override
  Widget build(BuildContext context) {
    //Calculated heights based on the screen dimensions
    final height = getHeights(context);

    return SingleChildScrollView(
      //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: <Widget>[
          //The top banner
          ResponsiveContainer(
            height: height['bannerHeight'],
            child: HomeBanner(),
          ),

          ResponsiveContainer(
            height: height['carouselHeight'],
            child: HomeCarouselSlider(),
          ),

          ResponsiveContainer(
            height: height['gridHeight'],
            child: HomeRow(),
          ),
        ],
      ),
    );
  }
}
