import 'package:coffee_shop/widgets/carousel.dart';
import 'package:coffee_shop/widgets/carousel_title.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/colors/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColor.blue,
            expandedHeight: 250.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: <Widget>[
                  Text(
                    'Ochota na kawę?',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: AppColor.white,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              titlePadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
          CarouselTitle(titleText: 'Polecane'),
          MenuCarousel(list: klasyka),
          SliverToBoxAdapter(
            child: SizedBox(height: 4),
          ),
          CarouselTitle(titleText: 'Klasyka'),
          MenuCarousel(list: klasyka),
          SliverToBoxAdapter(
            child: SizedBox(height: 4),
          ),
          CarouselTitle(titleText: 'Firmowe'),
          MenuCarousel(list: firmowe),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          print(index);
        },
        currentIndex: _selectedIndex,
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.light,
        unselectedItemColor: AppColor.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'Home',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text('Ulubione')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text('Profil')),
        ],
      ),
    );
  }
}

//SliverList(
//delegate: SliverChildBuilderDelegate((context, index) {
//return Container(
//height: 100,
//width: 100,
//child: Card(
//child: Text('Hey'),
//),
//);
//}, childCount: 10),
//),
