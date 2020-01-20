import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/screens/sign_in.dart';
import 'package:coffee_shop/services/database.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/code.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';

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
