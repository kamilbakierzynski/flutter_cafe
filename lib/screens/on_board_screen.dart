import 'package:coffee_shop/models/on_board_slider_model.dart';
import 'package:coffee_shop/screens/navigation_menu.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<OnBoardSlider> slides;
  int _currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  void initState() {
    slides = [
      OnBoardSlider(
          imagePath: "assets/images/menu_tab.png",
          title: 'Kawy i nie tylko',
          desc:
          'Przeglądaj wszystkie pyszności jakie oferujemy i znajdź coś dla siebie'),
      OnBoardSlider(
          imagePath: "assets/images/card_tab.png",
          title: 'Magiczna karta',
          desc:
          'Zbieraj punkty na kartę, którą masz zawsze przy sobie i wymieniaj na darmowe kawy!'),
      OnBoardSlider(
          imagePath: "assets/images/order_tab.png",
          title: 'Niech czeka...',
          desc:
          'Potrzebujesz kawy ale masz mało czasu?\nZamów przez aplikację i odbierz na miejscu.'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          itemCount: slides.length,
          controller: _pageController,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            OnBoardSlider slide = slides[index];
            return SliderTile(
              imageAssetPath: slide.imagePath,
              title: slide.title,
              description: slide.desc,
            );
          }),
      bottomSheet: _currentIndex != slides.length - 1
          ? Container(
        height: 60,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                      slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: Text(
                  'POMIŃ',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: <Widget>[
                  for (int i = 0; i < slides.length; i++)
                    _currentIndex == i
                        ? pageIndexIndicator(true)
                        : pageIndexIndicator(false)
                ],
              ),
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                      _currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: Text('DALEJ',
                    style: TextStyle(
                        color: Color(0xFF428bca),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
      )
          : GestureDetector(
        onTap: () =>
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => NavigationMenu(),
              ),
            ),
        child: Container(
          height: 60,
          color: Color(0xFF428bca),
          child: Center(
              child: Text('URUCHOM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600))),
        ),
      ),
    );
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: isCurrentPage ? 10.0 : 6.0,
        height: isCurrentPage ? 10.0 : 6.0,
        decoration: BoxDecoration(
            color: isCurrentPage ? Colors.grey[400] : Colors.grey[300],
            borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final String description;

  SliderTile({this.imageAssetPath, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                child: Image.asset(
                  imageAssetPath,
                  fit: BoxFit.fitHeight,
                )),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
