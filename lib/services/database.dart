import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/models/user.dart';
import 'package:coffee_shop/models/menu_item.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userDataCollection =
      Firestore.instance.collection('users');

  final CollectionReference itemsDataCollection =
    Firestore.instance.collection('data');


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

  UserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid ?? 'user',
        name: snapshot.data['name'] ?? 'User',
        points: snapshot.data['points'] ?? 0,
        reedemedCoffee: snapshot.data['reedemedCoffees'] ?? 0);
  }

  List<MenuItem> _menuItemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return MenuItem(
        category: doc.data['category'] ?? '',
        name: doc.data['name'] ?? '',
        description: doc.data['description'] ?? '',
        price: doc.data['price'] ?? [],
        imgUrl: doc.data['imgUrl'] ?? '',
        featured: doc.data['featured'] ?? false
      );
    }).toList();
  }

  Stream<List<MenuItem>> get getMenuItemsData {
    return itemsDataCollection.snapshots()
        .map(_menuItemListFromSnapshot);
  }

//  void uploadData(List<MenuItem> menu, String name) async {
//    final CollectionReference coffeeDataCollection =
//    Firestore.instance.collection(name);
//    for (var i = 0; i < menu.length; i++) {
//      await coffeeDataCollection
//          .document(menu[i].name)
//          .setData({
//        'category': menu[i].category,
//        'name': menu[i].name,
//        'description': menu[i].description,
//        'price': menu[i].price,
//        'imgUrl': menu[i].imgUrl,
//        'featured': menu[i].featured
//      });
//    }
//  }
}
