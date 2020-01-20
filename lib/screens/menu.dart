import 'package:coffee_shop/screens/menu_inside.dart';
import 'package:coffee_shop/services/database.dart';
import 'package:coffee_shop/widgets/inner_shadow.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'item.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coffee_shop/models/menu_item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> kategorie;
  List<List<MenuItem>> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kategorie = [];
//    items = [klasyka, firmowe, ciasto, kanapki, klasyka];
    items = [];
  }

  List<MenuItem> cache;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<List<MenuItem>>(
        initialData: cache,
        stream: DatabaseService(uid: user.uid).getMenuItemsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            kategorie = [];
            items = [];
            print('Data provided');
            List<MenuItem> menuItems = snapshot.data;
            menuItems.forEach((menuItem) {
              if (!kategorie.contains(menuItem.category)) {
                kategorie.add(menuItem.category);
                items.add([]);
              }
              var number = kategorie.indexOf(menuItem.category);
              items[number].add(menuItem);
            });
            cache = snapshot.data;
            return MenuInsideWidget(kategorie: kategorie, items: items,);
          } else {
            return Scaffold(
              backgroundColor: Color(0xFFEBECF0),
              body: Center(
                child: Loading(),
              ),
            );
          }
        });
  }
}
