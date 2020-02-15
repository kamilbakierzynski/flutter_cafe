import 'package:coffee_shop/widgets/top_nav_bar_cart.dart';
import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatefulWidget {
  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[TopNavBarCart()],
      ),
    );
  }
}
