import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/models/user_model.dart';
import 'package:coffee_shop/services/database_service.dart';
import 'package:coffee_shop/shared/colors.dart';
import 'package:coffee_shop/widgets/nav_app_bars/top_nav_bar_cart.dart';
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
  String _infoAboutOrder;
  bool _addPoints;
  bool _canPay;

  final TextStyle textStyle = TextStyle(
      fontSize: 17.0, color: Color(0xFF00704A), fontWeight: FontWeight.w400);

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _infoAboutOrder = '';
    _addPoints = true;
    _canPay = false;
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final List<CartItem> cartList = cart.cartItems;
    final UserData user = Provider.of<UserData>(context);
    final List<MenuItem> menuItems = Provider.of<List<MenuItem>>(context);

    return Scaffold(
        body: Column(
      children: <Widget>[
        TopNavBarCart(),
        Container(
          height: MediaQuery.of(context).size.height - 78,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SlimyCard(
                  color: Color(0xFFDFECE8),
                  width: MediaQuery.of(context).size.width - 80,
                  topCardHeight: 150,
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0),
                              ),
                              subtitle: item.size == ""
                                  ? null
                                  : Text("${item.size}  ${item.milk}"),
                              leading: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF00704A),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Za zamówienie otrzymasz:  ${_addPoints ? cart.countStars() : "0"}',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                      Icon(
                        Icons.favorite,
                        color: AppColors.red,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 4, left: 16, right: 16),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Dodaj uwagi dotyczące zamówienia',
                          ),
                          maxLength: 255,
                          minLines: 1,
                          maxLines: 5,
                          onChanged: (value) {
                            _infoAboutOrder = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: DropDownFormField(
                          titleText: 'Płatność',
                          hintText: _myActivity == ''
                              ? 'Proszę wybrać jedną'
                              : _myActivity,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: showBasedOnInput(user.points, cart),
                ),
                RaisedButton(
                  child:
                      Text(_myActivity == 'na_miejscu' ? 'Zamawiam' : 'Zapłać'),
                  onPressed: _canPay
                      ? () {
                          var price = cart.sum().toStringAsFixed(2) + ' zł';
                          var points = cart.countStars();
                          if (_myActivity == 'punktami') {
                            price = (-cart.countStars() * 10).toString();
                            points = 0;
                          }
                          if (_checkIfItemsNotAvaliable(
                              menuItems, cartList, cart, context)) {
                            Future processing = DatabaseService(uid: user.uid)
                                .createNewOrder(
                                    user.uid,
                                    cart.cartItems,
                                    _myActivity,
                                    price,
                                    points,
                                    _infoAboutOrder);
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
                          } else {
                            setState(() {
                              _canPay = false;
                            });
                          }
                        }
                      : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
//          _canPay
//              ? SliderButton(
//                  action: () {
//                    var price = cart.sum().toStringAsFixed(2) + ' zł';
//                    var points = cart.countStars();
//                    if (_myActivity == 'punktami') {
//                      price = (-cart.countStars() * 10).toString();
//                      points = 0;
//                    }
//                    if (_checkIfItemsNotAvaliable(menuItems, cartList, cart, context)) {
//                      Future processing = DatabaseService(uid: user.uid)
//                          .createNewOrder(user.uid, cart.cartItems, _myActivity,
//                          price, points, _infoAboutOrder);
//                      if (processing != null) {
//                        Toast.show(
//                            'Zamówienie zostało złożone. Sprawdź jego stan w zakładce Zamówienia.',
//                            context,
//                            duration: Toast.LENGTH_LONG,
//                            gravity: Toast.BOTTOM);
//                        cart.emptyCart();
//                        var nav = Navigator.of(context);
//                        nav.pop();
//                        nav.pop();
//                      }
//                    } else {
//                      print('Test');
//                    }
//                  },
//                  label: Text(
//                    'Przesuń, żeby zamówić',
//                    style: TextStyle(
//                        color: Color(0xff4a4a4a),
//                        fontWeight: FontWeight.w500,
//                        fontSize: 17),
//                  ),
//                  icon: Icon(
//                    Icons.payment,
//                    color: Colors.white,
//                  ),
//                  width: MediaQuery.of(context).size.width - 60,
//                  buttonColor: Color(0xFF00704A),
//                  backgroundColor: Color(0xFFDFECE8),
//                  highlightedColor: Colors.white,
//                  boxShadow: BoxShadow(color: Colors.white),
//                )
//              : SizedBox.shrink(),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget showBasedOnInput(int points, Cart cart) {
    switch (_myActivity) {
      case 'na_miejscu':
        {
          return Text(
              'Płatność gotówką lub kartą na miejscu.\n\nKlikając zamawiam'
              ' zobowiązujesz się do zapłaty złożonego zamówienia. Odbiór zamówienia'
              ' po okazaniu kodu QR w aplikacji.',
              textAlign: TextAlign.justify,
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

  bool _checkIfItemsNotAvaliable(List<MenuItem> menuItems,
      List<CartItem> cartItems, Cart cart, BuildContext context) {
    bool goodToGo = true;
    List<int> indexToDelete = [];
    cartItems.forEach((cartItem) {
      MenuItem correspondingItem =
          menuItems.firstWhere((menuItem) => menuItem.name == cartItem.name);
      if (!correspondingItem.avaliable) {
        indexToDelete.add(cartItems.indexOf(cartItem));
        print(correspondingItem);
        goodToGo = false;
      }
    });
    if (!goodToGo) {
      indexToDelete.forEach((index) {
        cart.delete(index);
      });
      _showOrderChangeDialog(
          'Tylko nie to...',
          'Jeden z twoich wybranych produktów niestety nie jest już dzisiaj dostępny :(',
          context);
    }
    return goodToGo;
  }

  _showOrderChangeDialog(String title, String message, BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
