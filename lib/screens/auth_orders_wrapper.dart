import 'package:coffee_shop/screens/orders_screen.dart';
import 'package:coffee_shop/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';

class AuthOrdersWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return SignInScreen();
    } else {
      return OrdersScreen();
    }
  }
}
