import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/screens/item.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:coffee_shop/widgets/more_info.dart';
import 'package:coffee_shop/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/menu_item.dart';

class HomeScreenSave extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenSave> {
  final List<String> menuCategories = [
    'Smaki dnia',
    'Firmowe',
    'Klasyka',
    'Kanapki',
    'Ciasta'
  ];
  int selectedCategory = 0;

  List<Color> listColors = [
    Color(0xFF1E3932),
    Color(0xFFC52836),
    Color(0xFF00704A)
  ];
  List<Color> complementaryListColors = [
    Color(0xFF068F60),
    Color(0xFFE67B96),
    Color(0xFF7ECCB8)
  ];

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    List<List<MenuItem>> items = [[], [], [], [], []];
    final menuItems = Provider.of<List<MenuItem>>(context);
    if (menuItems == null) {
      return Scaffold(
        backgroundColor: Color(0xFFEBECF0),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Loading(),
          ),
        ),
      );
    } else {
      menuItems.forEach((menuItem) {
        if (menuItem.category == 'firmowe') {
          items[1].add(menuItem);
        } else if (menuItem.category == 'klasyka') {
          items[2].add(menuItem);
        } else if (menuItem.category == 'kanapki') {
          items[3].add(menuItem);
        } else if (menuItem.category == 'ciasto') {
          items[4].add(menuItem);
        }
        if (menuItem.featured == true) {
          items[0].add(menuItem);
        }
      });

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
            TopNavigationBar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.78,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50.0))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, top: 20.0, right: 15.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Niech kawa czeka na Ciebie',
                                  style: TextStyle(
                                      color: Color(0xFF243F38),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  'a nie Ty na kawę',
                                  style: TextStyle(
                                      color: Color(0xFFA6BAB5),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(55.0),
                                ),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0EDE9),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(55.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                      itemCount: menuCategories.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 60.0, top: 20.0),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedCategory = index;
                                                  });
                                                },
                                                child: RotatedBox(
                                                    quarterTurns: 3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          menuCategories[index],
                                                          style: selectedCategory ==
                                                              index
                                                              ? TextStyle(
                                                              color: Color(
                                                                  0xFF00704A),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize: 15.0)
                                                              : TextStyle(
                                                              color: Color(
                                                                  0xFF00704A),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              fontSize: 14.0),
                                                        ),
                                                        SizedBox(
                                                          height: 2.0,
                                                        ),
                                                        selectedCategory == index
                                                            ? Container(
                                                          width: 7.0,
                                                          height: 7.0,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFF00704A),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10.0)),
                                                        )
                                                            : Container(
                                                          width: 7,
                                                          height: 7,
                                                        )
                                                      ],
                                                    )),
                                              )),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: ListView.builder(
                                  itemCount: items[selectedCategory].length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    List<MenuItem> selectedList =
                                    items[selectedCategory];
                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                          height: 200,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 65,
                                                  top: 0.0,
                                                  bottom: 10.0,
                                                ),
                                                child: GestureDetector(
                                                  onTap: selectedList[index]
                                                      .price
                                                      .length >
                                                      1
                                                      ? () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          ItemScreen(
                                                            item:
                                                            selectedList[
                                                            index],
                                                          ),
                                                    ),
                                                  )
                                                      : () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor: Colors.transparent,
                                                        builder: (context) {
                                                          return MoreInfoSheetWidget(
                                                            name: selectedList[
                                                            index].name,
                                                            description: selectedList[
                                                            index].description,
                                                          );
                                                        });
                                                  },
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: listColors[
                                                            index % 3],
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                    30.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                    30.0))),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              right: 15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    30.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                      5.0,
                                                                      top: 5.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            'GORĄCE I KREMOWE',
                                                                            style: TextStyle(
                                                                                color: complementaryListColors[index % 3],
                                                                                fontSize: 15.0,
                                                                                fontWeight: FontWeight.w400,
                                                                                letterSpacing: 1.5),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                            4.0,
                                                                          ),
                                                                          Text(
                                                                            selectedList[index].name,
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15.0,
                                                                                fontWeight: FontWeight.w400,
                                                                                letterSpacing: 1.0),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        selectedList[index].price[0].toStringAsFixed(2) +
                                                                            ' zł',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                            24.0,
                                                                            fontWeight:
                                                                            FontWeight.w900,
                                                                            letterSpacing: 0.3),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 80.0,
                                                    bottom: 40.0,
                                                    left: 40.0),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black12,
                                                              blurRadius: 0.5,
                                                              spreadRadius: 0.2,
                                                              offset:
                                                              Offset(0, 0))
                                                        ]),
                                                    width: 40,
                                                    height: 40,
                                                    child: IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: selectedList[
                                                      index]
                                                          .price
                                                          .length >
                                                          1
                                                          ? () =>
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ItemScreen(
                                                                    item: selectedList[
                                                                    index],
                                                                  ),
                                                            ),
                                                          )
                                                          : () {
                                                        CartItem item = CartItem(
                                                            name: selectedList[
                                                            index]
                                                                .name,
                                                            price: selectedList[
                                                            index]
                                                                .price[0],
                                                            size: '',
                                                            milk: '',
                                                            quantity: 1,
                                                            imgUrl: selectedList[
                                                            index]
                                                                .imgUrl);
                                                        cart.add(item);
                                                        Scaffold.of(
                                                            context)
                                                            .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  'Dodano do koszyka'),
                                                              action:
                                                              SnackBarAction(
                                                                label:
                                                                'Koszyk',
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            ));
                                                      },
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 200, top: 60),
                                                child: Container(
                                                  height: 240,
                                                  width: 240,
//                                                  child: Image.asset(
//                                                    "assets/images/starb2.png",
//                                                    fit: BoxFit.scaleDown,
//                                                  ),
                                                  child: Image.asset(
                                                    selectedList[index].imgUrl,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
