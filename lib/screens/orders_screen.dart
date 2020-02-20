import 'package:coffee_shop/widgets/custom_orders_bar.dart';
import 'package:coffee_shop/widgets/qr_order_sheet.dart';
import 'package:coffee_shop/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/order.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<UserOrder> orders = Provider.of<List<UserOrder>>(context);
    orders.sort((a, b) {
      return -a.time.compareTo(b.time);
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: orders.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TopNavigationBar(),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.store,
                          size: 100.0,
                          color: Color(0xFF068F60),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Nie masz zamówień :(',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Color(0xFF243F38)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              )
            : CustomScrollView(
                slivers: <Widget>[
                  CustomOrdersBar(),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    final UserOrder order = orders[index];
                    return Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0, bottom: 30.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFE0EDE9),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    color: order.state == 'collected'
                                        ? Colors.blueGrey
                                        : Color(0xFF00704A),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              order.orderId,
                                              style: TextStyle(
                                                  color:
                                                      order.state == 'collected'
                                                          ? Colors.white
                                                          : Color(0xFF7ECCB8)),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                order.points > 0
                                                    ? Row(
                                                        children: <Widget>[
                                                          Text(
                                                              '+${order.points}',
                                                              style: TextStyle(
                                                                color: order.state ==
                                                                        'collected'
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF7ECCB8),
                                                              )),
                                                          Icon(Icons.favorite,
                                                              color:
                                                                  Colors.white),
                                                          SizedBox(
                                                            width: 2.0,
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox.shrink(),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        prettifyState(
                                                            order.state),
                                                        style: TextStyle(
                                                          color: order.state ==
                                                                  'collected'
                                                              ? Colors.blueGrey
                                                              : Color(
                                                                  0xFF00704A),
                                                        ),
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(maxHeight: 300.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Container(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: order.order.length,
                                            itemBuilder: (context, index) {
                                              final String orderItem =
                                                  order.order[index];
                                              bool collected = false;
                                              if (order.state == 'collected') {
                                                collected = true;
                                              }
                                              return prettifyOrderList(
                                                  orderItem, collected);
                                            }),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: order.state == 'collected'
                                            ? Colors.blueGrey
                                            : Color(0xFF00704A),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    int.parse(order.time))
                                                .toString()
                                                .split(' ')[0],
                                            style: TextStyle(
                                                color:
                                                    order.state == 'collected'
                                                        ? Colors.white30
                                                        : Color(0xFF7ECCB8),
                                                fontSize: 20.0),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                prettifyPayment(order.payment),
                                                style: TextStyle(
                                                    color: order.state ==
                                                            'collected'
                                                        ? Colors.white54
                                                        : Color(0xFF7ECCB8),
                                                    fontSize: 16.0),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    order.price,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30.0),
                                                  ),
                                                  order.payment == 'punktami'
                                                      ? Row(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFFC52836),
                                                            ),
                                                          ],
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        order.state == "collected"
                            ? SizedBox.shrink()
                            : Positioned(
                                bottom: 5,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return QrCodeSheetWidget(
                                                  order.orderId,
                                                  order.customer);
                                            });
                                      },
                                      child: Text('Odbierz'),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    );
                  }, childCount: orders.length))
                ],
              ));
  }

  String prettifyState(String state) {
    switch (state) {
      case 'ordered':
        {
          return 'Zamówiono';
        }
        break;
      case 'payed':
        {
          return 'Zamówiono';
        }
        break;
      case 'preaparing':
        {
          return 'Przygotowywanie';
        }
        break;
      case 'ready':
        {
          return 'Gotowe do odbioru';
        }
        break;
      case 'collected':
        {
          return 'Odebrano';
        }
        break;
      default:
        {
          return 'Błąd';
        }
        break;
    }
  }

  String prettifyPayment(String payment) {
    switch (payment) {
      case 'na_miejscu':
        {
          return "Płatność na miejscu";
        }
        break;
      case 'punktami':
        {
          return "Płatność punktami";
        }
        break;
      default:
        {
          return 'Błąd';
        }
    }
  }

  Widget prettifyOrderList(String string, bool collected) {
    var list = string.split("-");
    var quantity = list[0];
    quantity = quantity.replaceAll("X", '');
    print(list);
    var name = list[1];
    var size = list[2];
    var milk = list[3];
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: collected ? Colors.grey[700] : Colors.black),
      ),
      subtitle: size == '' ? null : Text(size + " " + milk),
      leading: Container(
          decoration: BoxDecoration(
              color: collected ? Colors.blueGrey : Color(0xFF00704A),
              borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${quantity}x",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
