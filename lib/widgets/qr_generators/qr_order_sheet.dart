import 'package:coffee_shop/widgets/qr_generators/qr_code_user.dart';
import 'package:flutter/material.dart';

class QrCodeSheetWidget extends StatelessWidget {
  final String code;
  final String uid;
  final String state;

  QrCodeSheetWidget(this.code, this.uid, this.state);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
      child: Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0))),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(0xFFC52836)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          code,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Colors.white),
                        ),
                        Text(
                          'POKAŻ KOD OBSŁUDZE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state,
                          style: TextStyle(
                            color: Color(0xFFC52836),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.width / 1.5,
                    child: QrCodeUser(
                      uid: code + " " + uid,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
