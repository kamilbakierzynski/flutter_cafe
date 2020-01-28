import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:coffee_shop/models/user.dart';

class SnippetCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Twoja karta',
          style: TextStyle(
              color: Color(0xFF434668),
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 3.0,
                    blurRadius: 10.0,
                    offset: Offset(6.0, 6.0)),
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3.0,
                    blurRadius: 10.0,
                    offset: Offset(-6.0, -6.0))
              ]),
          height: MediaQuery.of(context).size.width * 0.65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: QrImage(
                data: user.uid,
                version: QrVersions.auto,
                foregroundColor: Color(0xFF434668),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Container(
            child: Text(
              'Podaj kod podczas płatności a do twojego konta zostaną dodane punkty',
              style: TextStyle(
                  color: Color(0xFF434668).withAlpha(150),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '1 kawa = 1 punkt',
          style: TextStyle(
              color: Color(0xFF434668).withAlpha(150),
              fontSize: 15.0,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
