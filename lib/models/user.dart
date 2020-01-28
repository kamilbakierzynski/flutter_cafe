class User {
  final String uid;

  User({this.uid});
}


class UserData {

  final String uid;
  final String name;
  final int points;
  final int reedemedCoffee;
  final List<String> favourites;

  UserData({this.uid, this.name, this.points, this.reedemedCoffee, this.favourites});

}