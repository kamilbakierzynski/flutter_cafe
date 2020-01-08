import 'package:coffee_shop/models/menu_item.dart';
import 'package:flutter/material.dart';
import '../screens/code.dart';

class ItemScreen extends StatefulWidget {
  final MenuItem item;

  ItemScreen({this.item});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ItemScreen> {
  int _selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F9),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 50.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Hero(
              tag: widget.item,
              child: Image.asset(widget.item.imgUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.item.name,
                style: TextStyle(
                    color: Color(0xFF434668),
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.item.description,
                style: TextStyle(
                    color: Color(0xFFC1C4CD), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          widget.item.price.length == 1
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Size',
                      style: TextStyle(
                          color: Color(0xFF434668),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
          SizedBox(
            height: 20.0,
          ),
          widget.item.price.length == 1
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRadio = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFFD0D1D9)),
                            color: _selectedRadio == 0
                                ? Color(0xFFEBEDEE)
                                : Color(0xFFF5F7F9),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                  color: Color(0xFF434668),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRadio = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFFD0D1D9)),
                            color: _selectedRadio == 1
                                ? Color(0xFFEBEDEE)
                                : Color(0xFFF5F7F9),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                  color: Color(0xFF434668),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CodeScreen(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFFF09369),
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50.0,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Wykorzystaj punkty',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget
                            .item
                            .price[widget.item.price.length > 1
                                ? _selectedRadio
                                : 0]
                            .toString() +
                        '0 zł',
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
