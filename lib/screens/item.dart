import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/widgets/inner_shadow.dart';
import 'package:coffee_shop/widgets/size_button.dart';
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
      backgroundColor: Color(0xFFEBECF0),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 40.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF434668),
                ),
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
          Expanded(
            child: SizedBox(),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFEBECF0),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3.0,
                      blurRadius: 10.0,
                      offset: Offset(-6.0, -6.0))
                ]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          widget.item.name,
                          style: TextStyle(
                              color: Color(0xFF434668),
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: widget.item.price.length > 1
                              ? Text(
                                  '430ml',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0),
                                )
                              : Text(''))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Flexible(
                          child: Text(
                            widget.item.description,
                            style: TextStyle(
                                color: Color(0xFFC1C4CD),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
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
                            color: Color(0xFF434668),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      )
                    ],
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
                            'Rozmiar',
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
                              child: _selectedRadio == 0
                                  ? SizeButtonWidget(
                                      displayText: 'S', selected: true)
                                  : SizeButtonWidget(
                                      displayText: 'S', selected: false),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedRadio = 1;
                                });
                              },
                              child: _selectedRadio == 1
                                  ? SizeButtonWidget(
                                      displayText: 'L', selected: true)
                                  : SizeButtonWidget(
                                      displayText: 'L', selected: false),
                            )
                          ],
                        ),
                      ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
