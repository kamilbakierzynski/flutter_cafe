import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/models/user_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/models/user_order_model.dart';
import 'package:shortid/shortid.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userDataCollection =
      Firestore.instance.collection('users');

  final CollectionReference itemsDataCollection =
      Firestore.instance.collection('data');

  final CollectionReference ordersDataCollection =
      Firestore.instance.collection('orders');

  final CollectionReference appDataCollection =
      Firestore.instance.collection('app-data');

  Future createUserData(String name) async {
    return await userDataCollection.document(uid).setData({
      'name': name,
      'points': 0,
      'reedemedCoffees': 0,
    });
  }

  Stream<UserData> get userData {
    return userDataCollection.document(uid).snapshots().map(_userFromSnapshot);
  }

  Stream<List<UserOrder>> get userOrders {
    final CollectionReference userOrdersCollection = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('orders');
    return userOrdersCollection.snapshots().map(_orderFromSnapshot);
  }

  List<UserOrder> _orderFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserOrder(
        customer: doc.data["customer"] ?? '',
        order: doc.data["order"] ?? [],
        orderId: doc.data["orderId"] ?? '',
        payment: doc.data["payment"] ?? '',
        state: doc.data["state"] ?? '',
        time: doc.data["time"] ?? '',
        price: doc.data["price"] ?? '',
        points: doc.data["points"] ?? 0,
      );
    }).toList();
  }

  UserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return snapshot != null
        ? UserData(
            uid: uid ?? 'user',
            name: snapshot.data['name'] ?? 'User',
            points: snapshot.data['points'] ?? 0,
            reedemedCoffee: snapshot.data['reedemedCoffees'] ?? 0,
            favourites: snapshot.data['favourites'] ?? [],
            deviceToken: snapshot.data['pushToken'] ?? '')
        : null;
  }

  List<MenuItem> _menuItemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return MenuItem(
          category: doc.data['category'] ?? '',
          name: doc.data['name'] ?? '',
          description: doc.data['description'] ?? '',
          menuDescription: doc.data['menu_description'] ?? 'GORĄCE I KREMOWE',
          price: doc.data['price'] ?? [],
          size: doc.data['size'] ?? [],
          imgUrl: doc.data['imgUrl'] ?? '',
          featured: doc.data['featured'] ?? false,
          newItem: doc.data['newItem'] ?? false,
          avaliable: doc.data['avaliable'] ?? true);
    }).toList();
  }

  Stream<List<MenuItem>> get getMenuItemsData {
    return itemsDataCollection.snapshots().map(_menuItemListFromSnapshot);
  }

  Future createNewOrder(String uid, List<CartItem> items, String payment,
      String price, int points, String info) async {
    final id = shortid.generate();
    List<String> output = [];
    items.forEach((item) {
      output.add(
          "${item.quantity.toString()}X-${item.name}-${item.size}-${item.milk}");
    });
    print(id);
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    await ordersDataCollection.document(id).setData({
      'customer': uid,
      'orderId': id,
      'order': output,
      'payment': payment,
      'state': 'ordered',
      'time': time,
      'price': price,
      'points': points,
      'info': info,
    });

    await userDataCollection
        .document(uid)
        .collection('orders')
        .document(id)
        .setData({
      'customer': uid,
      'orderId': id,
      'order': output,
      'payment': payment,
      'state': 'ordered',
      'time': time,
      'price': price,
      'points': points,
    });

    return true;
  }

  void uploadData(List<MenuItem> menu, String name) async {
    final CollectionReference coffeeDataCollection =
        Firestore.instance.collection(name);
    for (var i = 0; i < menu.length; i++) {
      await coffeeDataCollection.document(menu[i].name).setData({
        'category': menu[i].category,
        'name': menu[i].name,
        'description': menu[i].description,
        'price': menu[i].price,
        'size': menu[i].size,
        'imgUrl': menu[i].imgUrl,
        'featured': menu[i].featured
      });
    }
  }
}
