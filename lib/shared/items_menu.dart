import 'package:flutter/material.dart';


class ItemsMenu extends ChangeNotifier {
  List<ItemsMenu> _items = [];
  List<ItemsMenu> get items => _items;

  set items(List<ItemsMenu> val) {
    _items = val;
    notifyListeners();
  }

}