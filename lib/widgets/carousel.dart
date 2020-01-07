import 'package:coffee_shop/colors/colors.dart';
import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuCarousel extends StatelessWidget {
  final List<MenuItem> list;

  MenuCarousel({this.list});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            MenuItem item = list[index];
            return Padding(
              padding: index == 0 ? EdgeInsets.only(left: 30.0) : EdgeInsets.only(left: 15.0),
              child: Card(
                elevation: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 180,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.imgUrl),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: AppColor.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(item.name, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColor.black), overflow: TextOverflow.clip,),
                              Text(item.price.toString() + '0,-', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColor.black),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
