import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/models/cart_item_model.dart';
import 'package:coffee_shop/models/menu_item_model.dart';
import 'package:coffee_shop/models/app_data_model.dart';
import 'package:coffee_shop/widgets/animations/animated_count.dart';
import 'package:coffee_shop/widgets/more_info_bottom_card.dart';
import 'package:coffee_shop/utils/negative_radius_painter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatefulWidget {
  final MenuItem item;
  final CartItem cartItem;

  ItemScreen({this.item, this.cartItem});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ItemScreen> {
  String dropdownSize = AppData.sizesStatic.first;
  int dropdownSizeIndex = 0;

  String dropdownMilk = AppData.milksStatic.first;
  int dropdownMilkIndex = 0;

  int counter = 1;
  bool _isMinusDisabled = true;
  double price = 8.99;
  double calculatedPrice = 8.99;

  @override
  void initState() {
    calculatedPrice = price;
    if (widget.cartItem != null) {
      dropdownMilk = widget.cartItem.milk;
      dropdownSize = widget.cartItem.size;
      dropdownSizeIndex = dropdownSize.indexOf(widget.cartItem.size);
      dropdownMilkIndex = dropdownMilk.indexOf(widget.cartItem.milk);
      counter = widget.cartItem.quantity;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    price = widget.item.price[dropdownSizeIndex];
    calculatedPrice = (price + AppData.milkPricesStatic[dropdownMilkIndex]) * counter;
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFB),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 40.0),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF203B34),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'MOOSEE COFFEE',
                        style: TextStyle(
                            color: Color(0xFF1D1D1B),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0,
                            letterSpacing: 2.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'al. Grunwaldzka 116, Wrzeszcz',
                        style: TextStyle(
                            color: Color(0xFFA1B5B0),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45.0),
                topLeft: Radius.circular(45.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(-0.6, -0.75),
                  stops: [0.0, 0.5, 0.5, 1],
                  colors: [
                    Color(0xff1E3932),
                    Color(0xff1E3932),
                    Color(0xFFFBFAFB),
                    Color(0xFFFBFAFB),
                  ],
                  tileMode: TileMode.repeated,
                )),
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Hero(
                            tag: widget.item,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30.0, left: 20),
                              child: Image.asset(
                              widget.item.imgUrl,
//                                "assets/images/starb2.png",
                                fit: BoxFit.fill,
                              ),
                            ),
//              child: Image.asset("assets/images/coffee_shadow.png")
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return MoreInfoSheetWidget(
                                      menuItem: widget.item,
                                      complementaryColor: Color(0xFF00704A),
                                      backgroundColor: Color(0xFF1E3932),

                                    );
                                  });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xFF00704A),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  AutoSizeText(
                                    'Dowiedz się więcej',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 281,
                      width: 50,
                      color: Colors.transparent,
                      child: CustomPaint(
                        painter: NegativeRadius(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 280),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFDFECE8),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(42.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'Dopasuj do swoich preferencji',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xFF243F38),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 25.0, right: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(
                                      widget.item.name,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      wrapWords: false,
                                      style: TextStyle(
                                          color: Color(0xFFA6BAB5),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Rozmiar',
                                      style: TextStyle(
                                          color: Color(0xFF1E3932),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20.0),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          value: dropdownSize,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          iconEnabledColor: Color(0xFF01704B),
                                          onChanged: (String value) {
                                            setState(() {
                                              dropdownSize = value;
                                              dropdownSizeIndex =
                                                  AppData.sizesStatic.indexOf(value);
                                            });
                                          },
                                          items: AppData.sizesStatic
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: SizedBox(
                                                width: 40,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Color(0xFF01704B),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 17.0),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            );
                                          }).toList()),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Mleko',
                                      style: TextStyle(
                                          color: Color(0xFF1E3932),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20.0),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          value: dropdownMilk,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          iconEnabledColor: Color(0xFF01704B),
                                          onChanged: (String value) {
                                            setState(() {
                                              dropdownMilk = value;
                                              dropdownMilkIndex =
                                                  AppData.milksStatic.indexOf(value);
                                            });
                                          },
                                          items: AppData.milksStatic
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: SizedBox(
                                                width: 100,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Color(0xFF01704B),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 17.0),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            );
                                          }).toList()),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD1E4DF),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 *
                                              0.5 -
                                          0.5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            color: Color(0xFF00704A),
                                            disabledColor: Color(0xFF7EA99E),
                                            onPressed: _isMinusDisabled
                                                ? null
                                                : () {
                                                    setState(() {
                                                      counter--;
                                                      calculatedPrice =
                                                          price * counter;
                                                      if (counter == 1) {
                                                        _isMinusDisabled = true;
                                                      }
                                                    });
                                                  },
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFE0EDE9),
                                                borderRadius:
                                                    BorderRadius.circular(6.0)),
                                            child: Center(
                                                child: Text(counter.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF1E3932),
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 18.0))),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            color: Color(0xFF00704A),
                                            onPressed: () {
                                              setState(() {
                                                counter++;
                                                calculatedPrice =
                                                    price * counter;
                                                if (counter > 1) {
                                                  _isMinusDisabled = false;
                                                }
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 60.0,
                                      color: Color(0xFF7EA99E),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    0.8 *
                                                    0.5 -
                                                0.5,
                                        child: Center(
                                          child: AnimatedCount(
                                              count: calculatedPrice,
                                              duration:
                                                  Duration(milliseconds: 200)),
//
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      CartItem item = CartItem(
                                          name: widget.item.name,
                                          price: calculatedPrice / counter,
                                          quantity: counter,
                                          size: dropdownSize,
                                          milk: dropdownMilk,
                                          imgUrl: widget.item.imgUrl);
                                      print(item.price);
                                      cart.add(item);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF00704A),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0))),
                                      child: Center(
                                          child: Text(
                                        'Dodaj do koszyka',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
