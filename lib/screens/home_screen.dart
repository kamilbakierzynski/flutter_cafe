import 'package:coffee_shop/models/cart_model.dart';
import 'package:coffee_shop/shared/colors.dart';
import 'package:coffee_shop/models/app_data_model.dart';
import 'package:coffee_shop/widgets/nav_app_bars/custom_app_bar.dart';
import 'package:coffee_shop/utils/disable_list_glow.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:coffee_shop/widgets/menu_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/menu_item_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    List<List<MenuItem>> items = [[], [], [], [], []];
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
        if (menuItem.category == 'firmowe') {
          items[1].add(menuItem);
        } else if (menuItem.category == 'klasyka') {
          items[2].add(menuItem);
        } else if (menuItem.category == 'kanapki') {
          items[3].add(menuItem);
        } else if (menuItem.category == 'ciasto') {
          items[4].add(menuItem);
        }
        if (menuItem.featured == true) {
          items[0].add(menuItem);
        }
      });

      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  CustomAppBar(),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      List<MenuItem> selectedList = items[selectedCategory];
                      MenuItem item = selectedList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 60.0, top: 20.0),
                        child: MenuListItem(item, AppColors.homeScreenListColors[index % AppColors.homeScreenListColors.length],
                            AppColors.homeScreenComplementaryListColors[index % AppColors.homeScreenComplementaryListColors.length]),
                      );
                    },
                    childCount: items[selectedCategory].length,
                  ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: MediaQuery.of(context).size.height - 80,
                    child: ScrollConfiguration(
                      behavior: DisableListGlow(),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            backgroundColor: Colors.transparent,
                            expandedHeight: 130,
                          ),
                          SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Container(
                                decoration: index == 0
                                    ? BoxDecoration(
                                        color: Color(0xFFE0EDE9),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50.0)))
                                    : BoxDecoration(
                                        color: Color(0xFFE0EDE9),
                                      ),
                                child: Padding(
                                  padding: index == 0
                                      ? const EdgeInsets.only(
                                          bottom: 60.0, top: 80.0)
                                      : const EdgeInsets.only(
                                          bottom: 60.0, top: 20.0),
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = index;
                                      });
                                    },
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              AppData.menuCategoriesStatic[index],
                                              style: selectedCategory == index
                                                  ? TextStyle(
                                                      color: Color(0xFF00704A),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 15.0)
                                                  : TextStyle(
                                                      color: Color(0xFF00704A),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14.0),
                                            ),
                                            SizedBox(
                                              height: 2.0,
                                            ),
                                            selectedCategory == index
                                                ? Container(
                                                    width: 7.0,
                                                    height: 7.0,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFF00704A),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0)),
                                                  )
                                          : SizedBox.shrink()
                                          ],
                                        )),
                                  )),
                                ),
                              );
                            }, childCount: AppData.menuCategoriesStatic.length),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ));
    }
  }
}
