import 'package:flutter/material.dart';

class MoreInfoSheetWidget extends StatelessWidget {
  final String name;
  final String description;

  MoreInfoSheetWidget({this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: Color(0xFFDFECE8),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                  color: Color(0xFF243F38)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19.0,
                  color: Color(0xFFA6BAB5)),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
