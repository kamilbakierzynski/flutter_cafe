import 'package:coffee_shop/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/card_screen.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user_model.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return SignInScreen();
    } else {
      return CodeScreen();
    }
  }
}
