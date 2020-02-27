import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeUser extends StatelessWidget {

  String uid;

  QrCodeUser({this.uid});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: QrImage(
          data: uid,
          version: QrVersions.auto,
          foregroundColor: Color(0xFF1E3932),
        ),
      ),
    );
  }
}
