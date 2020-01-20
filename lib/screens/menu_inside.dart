import 'package:coffee_shop/services/database.dart';
import 'package:coffee_shop/widgets/inner_shadow.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'item.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coffee_shop/models/menu_item.dart';

class MenuInsideWidget extends StatefulWidget {

  final List<String> kategorie;
  final List<List<MenuItem>> items;

  MenuInsideWidget({this.kategorie, this.items});


  @override
  _MenuInsideWidgetState createState() => _MenuInsideWidgetState();
}

class _MenuInsideWidgetState extends State<MenuInsideWidget> {

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBECF0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(31.5),
                bottomRight: Radius.circular(31.5)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFEBECF0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 2.0)),
                    ]),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Menu',
                            style: TextStyle(
                                color: Color(0xFF434668),
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () =>
                                SimpleHiddenDrawerProvider.of(context).toggle(),
                            color: Color(0xFF434668),
                            iconSize: 35.0,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.kategorie.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = index;
                                  print(index);
                                });
                              },
                              child: Padding(
                                padding: index == 0
                                    ? const EdgeInsets.only(
                                    left: 60.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                    right: 10.0)
                                    : const EdgeInsets.only(
                                    right: 10.0, top: 8.0, bottom: 8.0),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        widget.kategorie[index],
                                        style: TextStyle(
                                            color: index == _selected
                                                ? Colors.white
                                                : Color(0xFF434668),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: index == _selected
                                          ? Color(0xFF434668)
                                          : Color(0xFFEBECF0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 2.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(3.0, 2.0)),
                                        BoxShadow(
                                            color: Colors.white60,
                                            blurRadius: 2.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(-3.0, -2.0))
                                      ]),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFEBECF0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white70,
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                            offset: Offset(-3.0, -2.0))
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30.0)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEBECF0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                              offset: Offset(-3.0, -2.0))
                        ]),
                    child: ListView.builder(
                        itemCount: widget.items[_selected].length,
                        itemBuilder: (BuildContext context, int index) {
                          MenuItem item = widget.items[_selected][index];
                          bool _favourite = false;
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ItemScreen(
                                  item: item,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 7.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFEBECF0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(3.0, 2.0)),
                                      BoxShadow(
                                          color: Colors.white60,
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(-3.0, -2.0))
                                    ],
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            color: Color(0xFF434668),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0),
                                      ),
                                      IconButton(
                                        color: Color(0xFF434668),
                                        icon: _favourite
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                        onPressed: () {
                                          setState(() {
                                            _favourite = !_favourite;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
