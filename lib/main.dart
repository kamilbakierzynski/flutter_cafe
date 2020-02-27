import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:coffee_shop/models/user_order_model.dart';
import 'package:coffee_shop/screens/on_board_screen.dart';
import 'package:coffee_shop/services/auth_service.dart';
import 'package:coffee_shop/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';

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
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialAppWithUserData(),
    );
  }
}

class MaterialAppWithUserData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee App',
          theme: ThemeData(
            primaryColor: Color(0xFFE9ECF5),
            accentColor: Colors.lightBlueAccent,
          ),
          home: OnBoardScreen(),
        ),
      );
    }
    return MultiProvider(
      providers: [
        StreamProvider<UserData>.value(
            value: DatabaseService(uid: user.uid).userData),
        StreamProvider<List<UserOrder>>.value(
            value: DatabaseService(uid: user.uid).userOrders),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee App',
          theme: ThemeData(
            primaryColor: Color(0xFFE9ECF5),
            accentColor: Colors.lightBlueAccent,
          ),
          home: OnBoardScreen(),
        ),
      ),
    );
  }
}


