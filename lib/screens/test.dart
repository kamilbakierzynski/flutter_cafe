import 'package:coffee_shop/screens/auth_wrapper.dart';
import 'package:coffee_shop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Polecane",
          baseStyle: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
          colorLineSelected: Color(0xFF1E3932),
          selectedStyle: TextStyle(
              color: Color(0xFF1E3932),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        HomeScreen()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Karta",
          baseStyle: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
          colorLineSelected: Color(0xFFC52836),
          selectedStyle: TextStyle(
              color: Color(0xFFC52836),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        AuthWrapper()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      whithAutoTittleName: false,
      backgroundColorAppBar: Color(0xFFF5F7F9).withAlpha(135),
      iconMenuAppBar: Icon(
        Icons.menu,
        color: Color(0xFF434668),
        size: 30.0,
      ),
      elevationAppBar: 0,
      backgroundColorMenu: Colors.white,
      screens: items,
      typeOpen: TypeOpen.FROM_RIGHT,
      isDraggable: false,
      styleAutoTittleName: TextStyle(
          color: Color(0xFF434668),
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }
}
