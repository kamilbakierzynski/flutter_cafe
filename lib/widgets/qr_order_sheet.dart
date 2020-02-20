import 'package:coffee_shop/widgets/qr_code_user.dart';
import 'package:flutter/material.dart';

class QrCodeSheetWidget extends StatelessWidget {
  final String code;
  final String uid;

  QrCodeSheetWidget(this.code, this.uid);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: Color(0xFFDFECE8),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: QrCodeUser(uid: code + " " + uid,),),
      ),
    );
  }
}
