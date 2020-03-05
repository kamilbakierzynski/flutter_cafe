import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/item_screen.dart';
import 'package:coffee_shop/widgets/more_info_bottom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:toast/toast.dart';

class MenuListItem extends StatelessWidget {
  final MenuItem item;
  final Color backgroundColor;
  final Color complementaryColor;

  MenuListItem(this.item, this.backgroundColor, this.complementaryColor);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          height: 200,
          child: GestureDetector(
            onTap: () {
              if (item.avaliable) {
                if (item.price.length > 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ItemScreen(
                        item: item,
                      ),
                    ),
                  );
                } else {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return MoreInfoSheetWidget(
                          menuItem: item,
                          backgroundColor: backgroundColor,
                          complementaryColor: complementaryColor,
                        );
                      });
                }
              }
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                    top: 0.0,
                    bottom: 10.0,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5.0, top: 5.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                170,
                                            child: AutoSizeText(
                                              item.avaliable
                                                  ? item.menuDescription
                                                  : 'WRACAM JUTRO!!!',
                                              style: TextStyle(
                                                  color: complementaryColor,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1.5),
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                170,
                                            child: AutoSizeText(
                                              item.name,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    170) /
                                                2,
                                        child: AutoSizeText(
                                          item.price[0].toStringAsFixed(2) +
                                              ' zł',
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.3),
                                        ),
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
                item.avaliable
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 80.0, bottom: 40.0, left: 40.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 0.5,
                                      spreadRadius: 0.2,
                                      offset: Offset(0, 0))
                                ]),
                            width: 40,
                            height: 40,
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: item.price.length > 1
                                  ? () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ItemScreen(
                                            item: item,
                                          ),
                                        ),
                                      )
                                  : () {
                                      CartItem cartItem = CartItem(
                                          name: item.name,
                                          price: item.price[0],
                                          size: '',
                                          milk: '',
                                          quantity: 1,
                                          imgUrl: item.imgUrl);
                                      cart.add(cartItem);
                                      Toast.show(
                                          'Dodano do koszyka',
                                          context,
                                          duration: Toast.LENGTH_SHORT,
                                          gravity: Toast.BOTTOM);
                                    },
                            )),
                      )
                    : SizedBox.shrink(),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 75),
                      child: Container(
                        height: 240,
                        width: 240,
                        child: item.avaliable
                            ? Image.asset(
                                item.imgUrl,
                                fit: BoxFit.scaleDown,
                              )
                            : Image.asset(
                                item.imgUrl,
                                fit: BoxFit.scaleDown,
                                color: Colors.black45,
                              ),
                      ),
                    ),
                    item.avaliable
                        ? SizedBox.shrink()
                        : Padding(
                      padding: const EdgeInsets.only(left: 200, top: 125),
                      child: Container(
                        width: 110,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: Text(
                              'WYPRZEDANE',
                              style: TextStyle(color: backgroundColor),
                            )),
                      ),
                    ),
                  ],
                ),
                item.newItem
                    ? Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                          child: Center(
                              child: Text(
                            'NOWOŚĆ',
                            style: TextStyle(color: backgroundColor),
                          )),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          )),
    );
  }
}
