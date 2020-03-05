import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class MoreInfoSheetWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color complementaryColor;
  final MenuItem menuItem;

  MoreInfoSheetWidget(
      {this.backgroundColor, this.complementaryColor, this.menuItem});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
//          color: Color(0xFFDFECE8),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0))),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: backgroundColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            menuItem.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25.0,
                                color: Colors.white),
                          ),
                          Text(
                            menuItem.menuDescription,
                            style: TextStyle(
                                color: complementaryColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                        color:
                            menuItem.newItem ? Colors.white : backgroundColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                        child: Text(
                      'NOWOŚĆ',
                      style: TextStyle(color: backgroundColor),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                menuItem.description,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19.0,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            menuItem.price.length > 1
                ? SizedBox.shrink()
                : Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        CartItem cartItem = CartItem(
                            name: menuItem.name,
                            price: menuItem.price[0],
                            size: '',
                            milk: '',
                            quantity: 1,
                            imgUrl: menuItem.imgUrl);
                        cart.add(cartItem);
                        Toast.show('Dodano do koszyka', context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                      child: Container(
                        height: 60.0,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0))),
                        child: Center(
                            child: Text(
                          'Dodaj do koszyka',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
