import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/models/user_model.dart';
import 'package:coffee_shop/wrappers/auth_orders_wrapper.dart';
import 'package:coffee_shop/wrappers/auth_wrapper.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Polecane",
          baseStyle: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
          colorLineSelected: Color(0xFF1E3932),
          selectedStyle: TextStyle(
              color: Color(0xFF1E3932),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        HomeScreen()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Karta",
          baseStyle: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
          colorLineSelected: Color(0xFF1E3932),
          selectedStyle: TextStyle(
              color: Color(0xFF1E3932),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        AuthWrapper()));

    final FirebaseMessaging _fcm = FirebaseMessaging();

    _fcm.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');
//      showNotification(message['notification']);
      _showOrderChangeDialog(message['notification']['title'],
          message['notification']['body'], context);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    _getUser(auth).then((user) {
      if (user != null) {
        items.add(new ScreenHiddenDrawer(
            new ItemHiddenMenu(
              name: "Zamówienia",
              baseStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
              colorLineSelected: Color(0xFF1E3932),
              selectedStyle: TextStyle(
                  color: Color(0xFF1E3932),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            AuthOrdersWrapper()));

        final UserData userData = Provider.of<UserData>(context);
        if (userData.deviceToken != _fcm.getToken().toString()) {
          _fcm.getToken().then((token) async {
            print(user.uid);
            print('token: $token');
            Firestore.instance
                .collection('users')
                .document(user.uid)
                .updateData({'pushToken': token});
          }).catchError((err) {
            print(err.toString());
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      whithAutoTittleName: false,
      backgroundColorAppBar: Color(0xFFF5F7F9).withAlpha(135),
      iconMenuAppBar: Icon(
        Icons.menu,
        color: Color(0xFF434668),
        size: 30.0,
      ),
      elevationAppBar: 0,
      backgroundColorMenu: Colors.white,
      screens: items,
      typeOpen: TypeOpen.FROM_RIGHT,
      isDraggable: true,
      styleAutoTittleName: TextStyle(
          color: Color(0xFF434668),
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  _showOrderChangeDialog(String title, String message, BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
//    return showModalBottomSheet(
//        context: context,
//        builder: (context) {
//          return Container(
//            height: MediaQuery.of(context).size.height * 0.7,
//            child: Column(
//              children: <Widget>[Text(title), Text(message)],
//            ),
//          );
//        });
  }

  Future<FirebaseUser> _getUser(FirebaseAuth auth) async {
    return await auth.currentUser();
  }
}
