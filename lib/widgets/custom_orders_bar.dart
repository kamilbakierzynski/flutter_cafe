import 'package:coffee_shop/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class CustomOrdersBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: false,
      floating: true,
      expandedHeight: 0.0,
      centerTitle: true,
      leading: CartIcon(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF203B34),
          ),
          onPressed: () =>
              SimpleHiddenDrawerProvider.of(context).toggle(),
        ),
      ],
      title: Text(
        'MOOSEE COFFEE',
        style: TextStyle(
            color: Color(0xFF1D1D1B),
            fontWeight: FontWeight.w900,
            fontSize: 17.0,
            letterSpacing: 2.0),
      ),
    );
  }
}
