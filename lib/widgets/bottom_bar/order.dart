import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 6.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white30,
              ),
            ),
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              Text(
//                'Twoje punkty',
//                style: TextStyle(
//                  color: Colors.white,
//                  letterSpacing: 1.0,
//                  fontSize: 20.0,
//                ),
//              ),
//              Container(
//                height: 45.0,
//                width: 45.0,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(15.0),
//                  color: Colors.white,
//                ),
//                child: Center(
//                  child: Text(
//                    '13',
//                    style: TextStyle(color: Color(0xFF434668), fontSize: 25.0, fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ],
//          ),
        ],
      ),
    );
  }
}
