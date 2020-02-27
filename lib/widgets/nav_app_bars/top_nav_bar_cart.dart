import 'package:coffee_shop/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopNavBarCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    return Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 30.0, right: 0.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF203B34),
                  ),
                  onPressed: () => Navigator.pop(context)),
              Text(
                'MOOSEE COFFEE',
                style: TextStyle(
                    color: Color(0xFF1D1D1B),
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                    letterSpacing: 2.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Color(0xFFC52836),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text(
                    cart.length().toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              )
            ]));
  }
}
