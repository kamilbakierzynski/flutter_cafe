import 'package:coffee_shop/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  List<CartItem> cartItems = [];

  void add(CartItem item) {
    bool added = false;
    cartItems.forEach((olditem) {
      if (olditem.name == item.name &&
          olditem.size == item.size &&
          olditem.price == item.price &&
          olditem.milk == item.milk) {
        olditem.quantity += 1;
        added = true;
      }
    });
    if (!added) {
      cartItems.add(item);
    }
    notifyListeners();
  }

  void delete(index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  int length() {
    int output = 0;
    cartItems.forEach((item) {
      output += item.quantity;
    });
    return output;
  }

  double sum() {
    double output = 0;
    cartItems.forEach((item) {
      output += item.price * item.quantity;
    });
    return output;
  }

  int countStars() {
    int output = 0;
    cartItems.forEach((item) {
      if (item.size != "") {
        output += 1;
      }
    });
    return output;
  }

  void minusQuantity(index) {
    cartItems[index].quantity -= 1;
    if (cartItems[index].quantity == 0) {
      cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void plusQuantity(index) {
    cartItems[index].quantity += 1;
    notifyListeners();
  }

  void emptyCart() {
    cartItems = [];
    notifyListeners();
  }
}
