import 'package:coffee_shop/screens/register.dart';
import 'package:coffee_shop/screens/sign_in_card.dart';
import 'package:coffee_shop/screens/sign_in_card_wrapper.dart';
import 'package:flutter/material.dart';

class SnippetCardSignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              'assets/images/qrcodeblur.png',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RegisterScreen(mode: 1,),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
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
                    'Zarejestruj się',
                    style: TextStyle(
                        color: Color(0xFF434668),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignInCardScreen(),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
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
                    'Zaloguj się',
                    style: TextStyle(
                        color: Color(0xFF434668),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
