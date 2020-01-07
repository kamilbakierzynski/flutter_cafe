import 'package:coffee_shop/widgets/carousel.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        sheetBelow: Container(
            color: Colors.red
        ),
        grabbing: Container(
          color: Colors.blue,
        ),
        child: CarouselWidget(),
      ),
    );
  }
}