import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/item.dart';
import 'package:coffee_shop/widgets/more_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 65,
                  top: 0.0,
                  bottom: 10.0,
                ),
                child: GestureDetector(
                  onTap: item.price.length > 1
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemScreen(
                                item: item,
                              ),
                            ),
                          )
                      : () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return MoreInfoSheetWidget(
                                  name: item.name,
                                  description: item.description,
                                );
                              });
                        },
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
                                            width: MediaQuery.of(context).size.width - 170,
                                            child: AutoSizeText(
                                              item.menuDescription,
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
                                            width: MediaQuery.of(context).size.width - 170,
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
                                        width: (MediaQuery.of(context).size.width - 170) /2,
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
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 80.0, bottom: 40.0, left: 40.0),
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
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Dodano do koszyka'),
                                duration: Duration(seconds: 1),
                                action: SnackBarAction(
                                  label: 'Koszyk',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CartScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ));
                            },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 75),
                child: Container(
                  height: 240,
                  width: 240,
                  child: Image.asset(
                    item.imgUrl,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
