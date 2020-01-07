import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/screens/item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  int _currentCarousel = 1;

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
                      icon: Icon(Icons.arrow_drop_down),
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
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: CarouselSlider(
                initialPage: 1,
                enableInfiniteScroll: false,
                aspectRatio: 1.0,
                onPageChanged: (index) {
                  setState(() {
                    _currentCarousel = index;
                  });
                },
                items: klasyka.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ItemScreen(item: item,),
                          ),
                        ),
                        child: Stack(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: 80.0, left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFEBEDEE),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF434668),
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                        color: Color(0xFFC1C4CD),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: 400,
                              height: 300,
                              child: Image.asset(
                                'assets/images/coffee_cup.png',
                                fit: BoxFit.scaleDown,
                              )),
                        ]),
                      );
                    },
                  );
                }).toList()),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: klasyka.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 2.0,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentCarousel == klasyka.indexOf(item)
                              ? Color(0xFFD0D1D9)
                              : Color(0xFFE5E7E8)),
                    );
                  },
                );
              }).toList()),
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFFEC9E7C),
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Moje zamówienie',
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        color: Colors.white,
                        iconSize: 20.0,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    '15.90 zł',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
