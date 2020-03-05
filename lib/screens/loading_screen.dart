import 'package:coffee_shop/widgets/loading.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBECF0),
      body: Center(
        child: Loading(),
      ),
    );
  }
}
