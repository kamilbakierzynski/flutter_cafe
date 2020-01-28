import 'package:coffee_shop/screens/sign_in_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';

class SignInCardWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null) {
      return SignInCardScreen();
    } else {
      Navigator.pop(context);
    }
  }
}
