import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 45.0,
            width: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xFFEC9E7C),
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                    color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
          Text(
            'Moje punkty',
            style:
            TextStyle(color: Colors.white, letterSpacing: 1.0),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_up),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
