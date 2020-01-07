import 'package:coffee_shop/widgets/bottom_bar/order.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/carousel.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F9),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Kawa',
                      style: TextStyle(
                          color: Color(0xFF434668),
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 50.0,
                      color: Color(0xFF858795),
                      onPressed: () {},
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 40.0,
                  color: Color(0xFF858795),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'dnia',
                style: TextStyle(
                  color: Color(0xFF90929F),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CarouselWidget(),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              color: Color(0xFFE88557),
            ),
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: OrderWidget(),
          )
        ],
      ),
    );
  }
}
