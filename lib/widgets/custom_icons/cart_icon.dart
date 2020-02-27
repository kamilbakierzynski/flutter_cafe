import 'package:flutter/material.dart';
import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Cart cart = Provider.of<Cart>(context);

    return Container(
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Color(0xFF203B34),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        CartScreen()
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        CartScreen()
                ),
              );
            },
            child: cart.length() > 0 ? Padding(
              padding:
              const EdgeInsets.only(top: 23.0, left: 26.0),
              child: Container(
                height: 14,
                width: 14,
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
            ) : SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
