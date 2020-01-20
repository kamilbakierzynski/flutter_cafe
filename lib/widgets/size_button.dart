import 'package:flutter/material.dart';
import 'inner_shadow.dart';

class SizeButtonWidget extends StatefulWidget {
  String displayText;
  bool selected;

  @override
  _SizeButtonWidgetState createState() => _SizeButtonWidgetState();

  SizeButtonWidget({this.displayText, this.selected});
}

class _SizeButtonWidgetState extends State<SizeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.selected
        ? InnerShadow(
            color: Colors.black45,
            blur: 3.0,
            offset: Offset(2.0, 2.0),
            child: InnerShadow(
              color: Colors.white70,
              blur: 3.0,
              offset: Offset(-2.0, -2.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
//                  border: Border.all(color: Colors.black12),
                  color: Color(0xFFEBECF0),
                ),
                child: Center(
                  child: Text(
                    widget.displayText,
                    style: TextStyle(
                        color: Color(0xFF434668),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
//          border: Border.all(color: Color(0xFFD0D1D9)),
              color: Color(0xFFEBECF0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2.0,
                    blurRadius: 3.0,
                    offset: Offset(3.0, 3.0)),
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2.0,
                    blurRadius: 3.0,
                    offset: Offset(-2.0, -2.0))
              ],
            ),
            child: Center(
              child: Text(
                widget.displayText,
                style: TextStyle(
                    color: Color(0xFF434668),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            ),
          );
  }
}
