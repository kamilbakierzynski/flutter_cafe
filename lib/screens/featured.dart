import 'package:coffee_shop/screens/code.dart';
import 'package:coffee_shop/widgets/bottom_bar/order.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/carousel.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  var _controller = SnappingSheetController();

  List<String> _values = ['Kawa', 'Ciasto', 'Kanapka'];
  String _value = 'Kawa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        lockOverflowDrag: true,
        snappingSheetController: _controller,
        grabbingHeight: 90.0,
        snapPositions: [
          SnapPosition(
              positionPixel: 0.0,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 950)),
          SnapPosition(
              positionFactor: 0.5,
              snappingCurve: Curves.ease,
              snappingDuration: Duration(milliseconds: 500)),
        ],
        sheetBelow: Container(
          color: Color(0xFFE88557),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 0.0, left: 30.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Twój kod dodania',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [5, 3, 2, 8, 4].map((item) {
                    return Container(
                      height: MediaQuery.of(context).size.width / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text(
                            item.toString(),
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF434668),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Podaj kod podczas płatności a do twojego konta zostaną dodane punkty',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '1 kawa = 1 punkt',
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        grabbing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            border: Border.all(color: Colors.white10, width: 3.0),
            color: Color(0xFFE88557),
          ),
          width: MediaQuery.of(context).size.width,
          child: OrderWidget(),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 23.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: TextStyle(
                              color: Color(0xFF434668),
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0),
                          elevation: 1,
                          isDense: false,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 40.0,
                          value: _value,
                          items: _values.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 40.0,
                    color: Color(0xFF858795),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CodeScreen(),
                      ),
                    ),
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
            CarouselWidget(
              mode: _values.indexOf(_value),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
