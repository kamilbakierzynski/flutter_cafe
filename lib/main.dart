import 'package:coffee_shop/screens/featured.dart';
import 'package:coffee_shop/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFE9ECF5),
        accentColor: Colors.lightBlueAccent,
      ),
      home: FeaturedScreen(),
    );
  }
}