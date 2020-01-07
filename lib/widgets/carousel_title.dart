import 'package:coffee_shop/colors/colors.dart';
import 'package:flutter/material.dart';

class CarouselTitle extends StatelessWidget {

  final String titleText;

  CarouselTitle({this.titleText});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          titleText,
          style: TextStyle(color: AppColor.blue,fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
