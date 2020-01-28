import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/screens/test.dart';
import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        StreamProvider<List<MenuItem>>.value(
          value: DatabaseService().getMenuItemsData,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee App',
        theme: ThemeData(
          primaryColor: Color(0xFFE9ECF5),
          accentColor: Colors.lightBlueAccent,
        ),
        home: TestScreen(),
      ),
    );
  }
}
