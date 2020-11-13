import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final imgList = [
    'assets/images/hot-clearance-organic-sale.png',
    'assets/images/50-percent-off-sale.jpg',
    'assets/images/50-percent-off-sale.png',
    'assets/images/back-to-school-sale.jpg',
  ];

  final imgUrlList = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F361343570080170027%2F&psig=AOvVaw0MtGI4u8Hf7ykvClYj1Jnj&ust=1585122080090000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIjDz4vOsugCFQAAAAAdAAAAABAJ'
        'https://www.google.com/imgres?imgurl=https%3A%2F%2Fbrandpacks.com%2Fwp-content%2Fuploads%2Fedd%2F2018%2F03%2Fa4-grand-sale-poster-templates-1.jpg&imgrefurl=https%3A%2F%2Fbrandpacks.com%2Ftemplates%2Fa4-grand-sale-advertisement-templates%2F&tbnid=tEyp32H3YZsc_M&vet=12ahUKEwi81abdvbfoAhXK_4UKHRiUDw8QMygIegUIARDyAQ..i&docid=KEd2NMRcwL9bkM&w=1440&h=960&q=sale%20posters%20for%20shops%20landscape&ved=2ahUKEwi81abdvbfoAhXK_4UKHRiUDw8QMygIegUIARDyAQ',
    'https://app.designwizard.com/#/template/7f036890-81ab-11e7-be7e-8dcff79f78c0?tagId=35',
    'https://www.postermywall.com/index.php/art/template/ea7746e5e1376c5dced59a6555430d11/back-to-school-sale-landscape-poster-template-design'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
          height: 400.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          items: imgList.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(img,
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
