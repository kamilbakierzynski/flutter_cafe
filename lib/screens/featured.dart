import 'package:coffee_shop/widgets/bottom_bar/order.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:coffee_shop/widgets/snippet_card.dart';
import 'package:coffee_shop/widgets/snippet_card_signin.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/carousel.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/user.dart';
import 'package:coffee_shop/models/menu_item.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  var _controller = SnappingSheetController();

  List<String> _values = ['Kawa', 'Ciasto', 'Kanapka'];
  String _value = 'Kawa';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    List<List<MenuItem>> items = [[], [], []];
    final menuItems = Provider.of<List<MenuItem>>(context);
    if (menuItems == null) {
      return Scaffold(
        backgroundColor: Color(0xFFEBECF0),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Loading(),
          ),
        ),
      );
    } else {
      menuItems.forEach((menuItem) {
        if (menuItem.featured) {
          if (menuItem.category == 'klasyka' ||
              menuItem.category == 'firmowe') {
            items[0].add(menuItem);
          } else if (menuItem.category == 'ciasto') {
            items[1].add(menuItem);
          } else if (menuItem.category == 'kanapki') {
            items[2].add(menuItem);
          }
        }
      });

      return Scaffold(
        backgroundColor: Color(0xFFEBECF0),
        body: SnappingSheet(
          lockOverflowDrag: true,
          snappingSheetController: _controller,
          grabbingHeight: 60.0,
          snapPositions: [
            SnapPosition(
                positionPixel: 0.0,
                snappingCurve: Curves.elasticOut,
                snappingDuration: Duration(milliseconds: 950)),
            SnapPosition(
                positionFactor: 0.7,
                snappingCurve: Curves.ease,
                snappingDuration: Duration(milliseconds: 500)),
          ],
          sheetBelow: Container(
            color: Color(0xFF434668),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEBECF0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 0.0, left: 30.0, right: 30.0),
                child: user == null
                    ? SnippetCardSignInWidget()
                    : SnippetCardWidget(),
              ),
            ),
          ),
          grabbing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              color: Color(0xFF434668),
            ),
            width: MediaQuery.of(context).size.width,
            child: OrderWidget(),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          _value,
                          style: TextStyle(
                            color: Color(0xFF434668),
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 40.0,
                            color: Color(0xFF434668),
                          ),
                          elevation: 4,
                          initialValue: _value,
                          onSelected: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return _values.map((item) {
                              return PopupMenuItem(
                                child: Text(item),
                                value: item,
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () =>
                          SimpleHiddenDrawerProvider.of(context).toggle(),
                      color: Color(0xFF434668),
                      iconSize: 35.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'dnia',
                    style: TextStyle(
                      color: Color(0xFF90929F),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _controller.snapToPosition(
                  SnapPosition(
                      positionPixel: 0.0,
                      snappingCurve: Curves.elasticOut,
                      snappingDuration: Duration(milliseconds: 950)),
                ),
                child: CarouselWidget(
                  mode: _values.indexOf(_value),
                  options: items,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 65.0),
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Color(0xFFD0D1D9),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
