class UserOrder {
  final String customer;
  final List<dynamic> order;
  final String orderId;
  final String payment;
  final String state;
  final String time;
  final String price;
  final int points;

  UserOrder({this.customer, this.order, this.orderId, this.payment, this.state, this.time, this.price, this.points});
}