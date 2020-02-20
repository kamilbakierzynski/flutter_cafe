import 'package:coffee_shop/models/cart.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/user.dart';
import 'package:coffee_shop/services/database.dart';
import 'package:coffee_shop/widgets/top_nav_bar_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:toast/toast.dart';

class ConfirmOrderScreen extends StatefulWidget {
  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  final formKey = new GlobalKey<FormState>();
  String _myActivity;
  String _myActivityResult;
  bool _addPoints;
  bool _canPay;

  final TextStyle textStyle = TextStyle(
      fontSize: 17.0, color: Color(0xFF00704A), fontWeight: FontWeight.w400);

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    _addPoints = true;
    _canPay = false;
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final List<CartItem> cartList = cart.cartItems;
    final UserData user = Provider.of<UserData>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TopNavBarCart(),
          SlimyCard(
            color: Color(0xFFDFECE8),
            width: MediaQuery.of(context).size.width - 80,
            topCardHeight: (MediaQuery.of(context).size.width - 80) / 2,
            bottomCardHeight: 300,
            borderRadius: 30,
            topCardWidget: Text(
              cart.sum().toStringAsFixed(2) + " zł",
              style: TextStyle(
                  color: Color(0xFF00704A),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900),
            ),
            bottomCardWidget: Container(
              child: ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    CartItem item = cartList[index];
                    return Center(
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.0),
                        ),
                        subtitle: item.size == ""
                            ? null
                            : Text("${item.size}  ${item.milk}"),
                        leading: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF00704A),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "${item.quantity}x",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ),
                    );
                  }),
            ),
            slimeEnabled: true,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Za zamówienie otrzymasz:  ${_addPoints ? cart.countStars() : "0"}',
                  textAlign: TextAlign.justify,
                  style: textStyle,
                ),
                Icon(
                  Icons.favorite,
                  color: Color(0xFFC52836),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Text(
              'Aktualnie płatność możliwa jest za pomocą zebranych punktów lub przy płatności na miejscu.',
              textAlign: TextAlign.justify,
              style: textStyle,
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropDownFormField(
                    titleText: 'Płatność',
                    hintText:
                        _myActivity == '' ? 'Proszę wybrać jedną' : _myActivity,
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                      if (value == 'punktami') {
                        setState(() {
                          _addPoints = false;
                        });
                      }
                      if (value == 'na_miejscu') {
                        setState(() {
                          _addPoints = true;
                          _canPay = true;
                        });
                      }
                    },
                    dataSource: [
                      {
                        "display": "Płatność na miejscu",
                        "value": "na_miejscu",
                      },
                      {
                        "display": "Płatność punktami",
                        "value": "punktami",
                      },
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: showBasedOnInput(user.points, cart),
          ),
          RaisedButton(
            child: Text(_myActivity == 'na_miejscu' ? 'Zamawiam' : 'Zapłać'),
            onPressed: _canPay
                ? () {
                    var price = cart.sum().toStringAsFixed(2) + ' zł';
                    var points = cart.countStars();
                    if (_myActivity == 'punktami') {
                      price = (-cart.cartItems.length * 10).toString();
                      points = 0;
                    }
                    Future processing = DatabaseService(uid: user.uid)
                        .createNewOrder(user.uid, cart.cartItems, _myActivity,
                            price, points);
                    if (processing != null) {
                      Toast.show(
                          'Zamówienie zostało złożone. Sprawdź jego stan w zakładce Zamówienia.',
                          context,
                          duration: Toast.LENGTH_LONG,
                          gravity: Toast.BOTTOM);
                      cart.emptyCart();
                      var nav = Navigator.of(context);
                      nav.pop();
                      nav.pop();
                    }
                  }
                : null,
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    ));
  }

  Widget showBasedOnInput(int points, Cart cart) {
    switch (_myActivity) {
      case 'na_miejscu':
        {
          return Text(
              'Płatność gotówką lub kartą na miejscu. Klikając zamawiam'
              ' zobowiązujesz się do zapłaty złożonego zamówienia. Odbiór zamówienia'
              ' po okazaniu kodu w aplikacji.',
              style: textStyle);
        }
        break;
      case 'punktami':
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Masz ${points.toString()}', style: textStyle),
                  Icon(
                    Icons.favorite,
                    color: Color(0xFFC52836),
                  ),
                ],
              ),
              checkIfPossiblePayPoints(cart),
              checkIfEnoughPoints(cart, points),
            ],
          );
        }
        break;
      default:
        {
          return SizedBox.shrink();
        }
        break;
    }
  }

  Widget checkIfPossiblePayPoints(Cart cart) {
    if (cart.countStars() == cart.length()) {
      setState(() {
        _canPay = true;
      });
      return Text('');
    }
    setState(() {
      _canPay = false;
    });
    return Text(
      'To zamówienie nie może być opłacone za pomocą punktów. Wybierz płatność na miejscu.',
      style: textStyle,
      textAlign: TextAlign.justify,
    );
  }

  Widget checkIfEnoughPoints(Cart cart, int points) {
    if (cart.countStars() != cart.length()) {
      return Text('');
    }
    if (points >= cart.length() * 10 && cart.countStars() == cart.length()) {
      setState(() {
        _canPay = true;
      });
      return Text(
        'Wymieniasz ${cart.length() * 10} punktów.',
        style: textStyle,
      );
    }
    setState(() {
      _canPay = false;
    });
    return Text(
      'Masz za mało punktów by zrealizować to zamówienie',
      style: textStyle,
    );
  }
}