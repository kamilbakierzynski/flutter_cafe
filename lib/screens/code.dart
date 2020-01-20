import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/services/database.dart';
import 'package:coffee_shop/widgets/inner_shadow.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';

class CodeScreen extends StatefulWidget {
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  int _points = 0;
  int _counter = 0;
  bool showAnim = false;

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
//            DatabaseService(uid: user.uid).uploadData(dane, "data");
            if (_points != snapshot.data.points) {
              _points = snapshot.data.points;
              print(_points);
              _counter++;
              if (_counter > 1) {
                showAnim = true;
                Timer(Duration(seconds: 3), () {
                  setState(() {
                    showAnim = false;
                  });
                });
              }
            }
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    color: Color(0xFFEBECF0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 0.0,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.80,
                                            child: Text(
                                              snapshot.data.name + ',',
                                              style: TextStyle(
                                                color: Color(0xFF434668),
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.menu),
                                            onPressed: () =>
                                                SimpleHiddenDrawerProvider.of(
                                                        context)
                                                    .toggle(),
                                            color: Color(0xFF434668),
                                            iconSize: 35.0,
                                          )
                                        ],
                                      ),
                                      Text(
                                        snapshot.data.points >= 10
                                            ? 'czeka na Ciebie darmowa kawa!'
                                            : 'świetnie Ci idzie!',
                                        style: TextStyle(
                                            color: Color(0xFF434668),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Twoje punkty',
                                        style: TextStyle(
                                            color: Color(0xFF434668),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.points.toString(),
                                            style: TextStyle(
                                                color: Color(0xFF434668),
                                                fontSize: 55.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0),
                                          ),
                                          Text(
                                            '/10',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Expanded(
                              child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                    ),
                                    color: Color(0xFFEBECF0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white70,
                                          blurRadius: 10.0,
                                          spreadRadius: 10.0,
                                          offset: Offset(-20.0, -6.0)),
                                      BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 10.0,
                                          blurRadius: 10.0,
                                          offset: Offset(6.0, 19.0))
                                    ]),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26,
                                                spreadRadius: 3.0,
                                                blurRadius: 10.0,
                                                offset: Offset(6.0, 6.0)),
                                            BoxShadow(
                                                color: Colors.white70,
                                                spreadRadius: 1.0,
                                                blurRadius: 7.0,
                                                offset: Offset(-6.0, -6.0))
                                          ]),
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          'assets/images/qrcode.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(
//                        vertical: 30.0, horizontal: 20.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [5, 3, 2, 8, 4].map((item) {
//                        return Container(
//                          width: MediaQuery.of(context).size.width / 6,
//                          height: MediaQuery.of(context).size.width / 6,
//                          child: Card(
//                            elevation: 5,
//                            child: Center(
//                              child: Text(
//                                item.toString(),
//                                style: TextStyle(
//                                    color: Color(0xFF434668),
//                                    fontSize: 45.0,
//                                    fontWeight: FontWeight.bold,
//                                    letterSpacing: 1.0),
//                              ),
//                            ),
//                          ),
//                        );
//                      }).toList(),
//                    ),
//                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Text(
                                      'podaj swój kod podczas zamówienia, żeby wymienić punkty na kawę',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF434668),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _authService.signOut();
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
//          border: Border.all(color: Color(0xFFD0D1D9)),
                                        color: Color(0xFFEBECF0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 2.0,
                                              blurRadius: 3.0,
                                              offset: Offset(3.0, 3.0)),
                                          BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2.0,
                                              blurRadius: 3.0,
                                              offset: Offset(-2.0, -2.0))
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Wyloguj się',
                                          style: TextStyle(
                                              color: Color(0xFF434668),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: showAnim
                        ? Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.black45,
                              ),
                              Container(
                                height: 600,
                                width: 600,
                                child: FlareActor(
                                  'assets/images/successFast.flr',
                                  animation: 'Untitled',
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Color(0xFFEBECF0),
              body: Center(
                child: Loading(),
              ),
            );
          }
        });
  }
}
