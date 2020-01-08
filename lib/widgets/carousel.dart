import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/screens/item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarouselWidget extends StatefulWidget {

  final int mode;

  CarouselWidget({this.mode});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentCarousel = 1;

  List<List<MenuItem>> options = [kawa, ciasto, kanapki];

@override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
              items: options[widget.mode].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemScreen(
                            item: item,
                          ),
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
                            child: Hero(
                              tag: item,
                              child: Image.asset(
                                item.imgUrl,
                                fit: BoxFit.scaleDown,
                              )
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
            children: options[widget.mode].map((item) {
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
                        color: _currentCarousel == options[widget.mode].indexOf(item)
                            ? Color(0xFFD0D1D9)
                            : Color(0xFFE5E7E8)),
                  );
                },
              );
            }).toList()),
      ],
    );
  }
}
