import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/shared/colors.dart';
import 'package:coffee_shop/wrappers/auth_confirm_order_wrapper.dart';
import 'package:coffee_shop/widgets/nav_app_bars/top_nav_bar_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    final List<CartItem> cartList = cart.cartItems;

    return Scaffold(
      body: cart.sum() == 0
          ? Stack(
              children: <Widget>[
                TopNavBarCart(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        size: 100.0,
                        color: Color(0xFF068F60),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Koszyk jest pusty',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                            color: Color(0xFF243F38)),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                TopNavBarCart(),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          CartItem item = cartList[index];
                          return ListTile(
                            title: Text(item.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),),
                            subtitle: item.size == "" ? null : Text("${item.size}  ${item.milk}"),
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
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("${item.price.toStringAsFixed(2)} zł", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),),
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    cart.delete(index);
                                  },
                                  color: AppColors.red,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFFE0EDE9),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.0))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Do zapłaty',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                    color: Color(0xFF00704A)),
                              ),
                              Text(
                                cart.sum().toStringAsFixed(2) + ' zł',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0,
                                    color: Color(0xFF00704A)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AuthConfirmOrderWrapper())),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF00704A),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0))),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                              child: Text(
                            'Zamów',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
