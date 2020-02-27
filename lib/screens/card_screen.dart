import 'dart:async';
import 'package:coffee_shop/services/auth_service.dart';
import 'package:coffee_shop/services/database_service.dart';
import 'package:coffee_shop/shared/colors.dart';
import 'package:coffee_shop/widgets/animations/add_points_anim.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:coffee_shop/widgets/points_card.dart';
import 'package:coffee_shop/widgets/qr_generators/qr_code_user.dart';
import 'package:coffee_shop/widgets/nav_app_bars/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user_model.dart';
import 'package:slimy_card/slimy_card.dart';

class CodeScreen extends StatefulWidget {
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  int _points = 0;
  int _counter = 0;
  bool showAnim = false;

  final AuthService _authService = AuthService();

  final List<String> bonuses = [
    '',
    'Darmowa kawa',
    'Wymiana mleka',
    'Powiększenie kawy',
    'Dodatkowy szot',
    'Gratis ciasto do kawy'
  ];
  final List<int> bonusesPrice = [0, 10, 3, 5, 4, 8];

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
//            DatabaseService(uid: user.uid).uploadData(dane, "data");
            if (_points != snapshot.data.points) {
              _counter++;
              if (_counter > 1) {
                showAnim = true;
                Timer(Duration(seconds: 3), () {
                  setState(() {
                    showAnim = false;
                    _points = snapshot.data.points;
                  });
                });
              } else {
                _points = snapshot.data.points;
              }
            }
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 0.0),
                    child: Image.asset(
                      'assets/images/bckg.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.78,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0))),
                      ),
                    ],
                  ),
                  Container(
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      children: <Widget>[
                        SizedBox(
                          height: 100.0,
                        ),
                        SlimyCard(
                          color: Color(0xFFDFECE8),
                          width: MediaQuery.of(context).size.width - 80,
                          topCardHeight:
                              (MediaQuery.of(context).size.width - 80) / 1.5,
                          bottomCardHeight: 300,
                          borderRadius: 30,
                          topCardWidget: PointsCard(
                            points: _points,
                            name: snapshot.data.name,
                          ),
                          bottomCardWidget: QrCodeUser(
                            uid: user.uid,
                          ),
                          slimeEnabled: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0)),
                            child: Container(
                              height: MediaQuery.of(context).size.height -
                                  100 -
                                  (MediaQuery.of(context).size.width - 80) /
                                      1.5 -
                                  20 -
                                  60,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFDFECE8),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      topRight: Radius.circular(50.0))),
                              child: ListView.builder(
                                  itemCount: bonuses.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    if (index == 0) {
                                      return Padding(
                                          padding: index == 0
                                              ? const EdgeInsets.only(
                                                  top: 50.0,
                                                  left: 10.0,
                                                  right: 10.0,
                                                  bottom: 10.0)
                                              : const EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 10.0),
                                          child: Container(
                                              height: 100.0,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  await _authService.signOut();
                                                },
                                                child: Card(
                                                    elevation: 5,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Center(
                                                            child: Text(
                                                          'Wyloguj się',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .blueGrey),
                                                        )))),
                                              )));
                                    } else {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(
                                                top: 50.0,
                                                left: 10.0,
                                                right: 10.0,
                                                bottom: 10.0)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                        child: Container(
                                          height: 100.0,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          bonuses[index],
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              bonusesPrice[
                                                                      index]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            SizedBox(
                                                              width: 3.0,
                                                            ),
                                                            Icon(
                                                              Icons.favorite,
                                                              color: AppColors.red,
                                                              size: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            80 -
                                                            45,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black12,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0)),
                                                      ),
                                                      Container(
                                                        width: _points /
                                                            bonusesPrice[
                                                                index] *
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                80 -
                                                                45),
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            elevation: 5,
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TopNavigationBar(),
                  AddPointsAnimation(
                    showAnim: showAnim,
                  ),
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

//Scaffold(
//body: Stack(
//children: <Widget>[
//Container(
//color: Color(0xFFEBECF0),
//child: Padding(
//padding: const EdgeInsets.only(top: 50.0),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//SizedBox(
//height: 0.0,
//),
//Container(
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.only(left: 15.0),
//child: Column(
//crossAxisAlignment:
//CrossAxisAlignment.start,
//children: <Widget>[
//Row(
//mainAxisAlignment:
//MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Container(
//width: MediaQuery.of(context)
//.size
//    .width *
//0.80,
//child: Text(
//snapshot.data.name + ',',
//style: TextStyle(
//color: Color(0xFF434668),
//fontSize: 40.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 1.0,
//),
//overflow: TextOverflow.ellipsis,
//),
//),
//IconButton(
//icon: Icon(Icons.menu),
//onPressed: () =>
//SimpleHiddenDrawerProvider.of(
//context)
//.toggle(),
//color: Color(0xFF434668),
//iconSize: 35.0,
//)
//],
//),
//Text(
//snapshot.data.points >= 10
//? 'czeka na Ciebie darmowa kawa!'
//    : 'świetnie Ci idzie!',
//style: TextStyle(
//color: Color(0xFF434668),
//fontSize: 16.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 1.0),
//),
//],
//),
//),
//SizedBox(
//height: 15.0,
//),
//Padding(
//padding: const EdgeInsets.symmetric(
//horizontal: 15.0),
//child: Row(
//mainAxisAlignment:
//MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Text(
//'Twoje punkty',
//style: TextStyle(
//color: Color(0xFF434668),
//fontSize: 16.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 1.0),
//),
//Row(
//children: <Widget>[
//Text(
//snapshot.data.points.toString(),
//style: TextStyle(
//color: Color(0xFF434668),
//fontSize: 55.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 1.0),
//),
//Text(
//'/10',
//style: TextStyle(
//color: Colors.grey,
//fontSize: 15.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 1.0),
//),
//],
//),
//],
//),
//)
//],
//),
//),
//SizedBox(
//height: 30.0,
//),
//Expanded(
//child: Stack(
//children: <Widget>[
//Container(
//decoration: BoxDecoration(
//borderRadius: BorderRadius.only(
//topRight: Radius.circular(30.0),
//topLeft: Radius.circular(30.0),
//),
//color: Color(0xFFEBECF0),
//boxShadow: [
//BoxShadow(
//color: Colors.white70,
//blurRadius: 10.0,
//spreadRadius: 10.0,
//offset: Offset(-20.0, -6.0)),
//BoxShadow(
//color: Colors.black26,
//spreadRadius: 10.0,
//blurRadius: 10.0,
//offset: Offset(6.0, 19.0))
//]),
//),
//Column(
//mainAxisAlignment:
//MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.only(top: 40.0),
//child: Container(
//decoration: BoxDecoration(
//borderRadius:
//BorderRadius.circular(30),
//boxShadow: [
//BoxShadow(
//color: Colors.black26,
//spreadRadius: 3.0,
//blurRadius: 10.0,
//offset: Offset(6.0, 6.0)),
//BoxShadow(
//color: Colors.white70,
//spreadRadius: 1.0,
//blurRadius: 7.0,
//offset: Offset(-6.0, -6.0))
//]),
//height:
//MediaQuery.of(context).size.width *
//0.8,
//child: ClipRRect(
//borderRadius: BorderRadius.circular(30),
//child: Padding(
//padding: const EdgeInsets.all(8.0),
//child: QrImage(
//data: user.uid,
//version: QrVersions.auto,
//foregroundColor: Color(0xFF434668),
//),
//),
//),
//),
//),
////                  Padding(
////                    padding: const EdgeInsets.symmetric(
////                        vertical: 30.0, horizontal: 20.0),
////                    child: Row(
////                      mainAxisAlignment: MainAxisAlignment.spaceAround,
////                      children: [5, 3, 2, 8, 4].map((item) {
////                        return Container(
////                          width: MediaQuery.of(context).size.width / 6,
////                          height: MediaQuery.of(context).size.width / 6,
////                          child: Card(
////                            elevation: 5,
////                            child: Center(
////                              child: Text(
////                                item.toString(),
////                                style: TextStyle(
////                                    color: Color(0xFF434668),
////                                    fontSize: 45.0,
////                                    fontWeight: FontWeight.bold,
////                                    letterSpacing: 1.0),
////                              ),
////                            ),
////                          ),
////                        );
////                      }).toList(),
////                    ),
////                  ),
//SizedBox(
//height: 20.0,
//),
//Padding(
//padding: const EdgeInsets.symmetric(
//horizontal: 40.0),
//child: Text(
//'zeskanuj kod podczas składania zamówienia, żeby wymienić punkty na kawę',
//textAlign: TextAlign.center,
//style: TextStyle(
//color: Color(0xFF434668),
//fontSize: 15.0,
//fontWeight: FontWeight.w600,
//letterSpacing: 1.0,
//),
//),
//),
//SizedBox(
//height: 20.0,
//),
//GestureDetector(
//onTap: () async {
//await _authService.signOut();
//},
//child: Container(
//width:
//MediaQuery.of(context).size.width / 3,
//height: 50.0,
//decoration: BoxDecoration(
//borderRadius:
//BorderRadius.circular(15.0),
////          border: Border.all(color: Color(0xFFD0D1D9)),
//color: Color(0xFFEBECF0),
//boxShadow: [
//BoxShadow(
//color: Colors.black12,
//spreadRadius: 2.0,
//blurRadius: 3.0,
//offset: Offset(3.0, 3.0)),
//BoxShadow(
//color: Colors.white,
//spreadRadius: 2.0,
//blurRadius: 3.0,
//offset: Offset(-2.0, -2.0))
//],
//),
//child: Center(
//child: Text(
//'Wyloguj się',
//style: TextStyle(
//color: Color(0xFF434668),
//fontWeight: FontWeight.bold,
//fontSize: 17.0),
//),
//),
//),
//),
//SizedBox(
//height: 20.0,
//)
//],
//),
//],
//))
//],
//),
//),
//),
//Center(
//child: Stack(
//children: <Widget>[
//AnimatedContainer(
//height:
//showAnim ? MediaQuery.of(context).size.height : 0,
//width: MediaQuery.of(context).size.width,
//color: showAnim ? Colors.black87 : Colors.transparent,
//duration: Duration(seconds: 1),
//curve: Curves.fastOutSlowIn,
//child: showAnim
//? FlareActor(
//'assets/images/confetti.flr',
//animation: 'boom',
//)
//: SizedBox.shrink(),
//),
//showAnim
//? Container(
//height: showAnim ? 600 : 0,
//width: showAnim ? 600 : 0,
//child: FlareActor(
//'assets/images/successFast.flr',
//animation: 'Untitled',
//),
//)
//: SizedBox.shrink(),
//],
////))
//],
//),
//);
