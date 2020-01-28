import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/widgets/size_button.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFFFCFBFC),
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
          Expanded(
            child: Container(
              child: Hero(
                tag: widget.item,
                child: Image.asset(widget.item.imgUrl),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AutoSizeText(
                          widget.item.name,
                          maxLines: 2,
                          wrapWords: false,
                          style: TextStyle(
                              color: Color(0xFF434668),
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: widget.item.category == 'klasyka' ||
                                widget.item.category == 'firmowe'
                            ? Text(
                                widget.item.price.length > 1
                                    ? widget.item.size[_selectedRadio].toString() + 'ml'
                                    : widget.item.size[0].toString() + 'ml',
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
                              .toStringAsFixed(2) + ' zł',
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
        ],
      ),
    );
  }
}
