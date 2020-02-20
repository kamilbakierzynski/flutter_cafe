import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';

class TopNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Cart cart = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 30.0, right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
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
          ),
          Text(
            'MOOSEE COFFEE',
            style: TextStyle(
                color: Color(0xFF1D1D1B),
                fontWeight: FontWeight.w900,
                fontSize: 17.0,
                letterSpacing: 2.0),
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFF203B34),
            ),
            onPressed: () =>
                SimpleHiddenDrawerProvider.of(context).toggle(),
          ),
        ],
      ),
    );
  }
}
