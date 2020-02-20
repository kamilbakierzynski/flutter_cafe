import 'package:coffee_shop/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      expandedHeight: 200.0,
      centerTitle: true,
      leading: CartIcon(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF203B34),
          ),
          onPressed: () => SimpleHiddenDrawerProvider.of(context).toggle(),
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
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/bckg_small.png',
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50.0))),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
