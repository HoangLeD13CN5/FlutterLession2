import 'package:flutter/material.dart';
import 'package:lession_2/constants/responsive_ui.dart';
import 'package:lession_2/ui/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  bool _large;
  bool _medium;
  double _width;
  double _height;
  double _pixelRatio;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: [
          tripPage('assets/images/one.jpg', 1, 4, 'Yosemite National Park',
              'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.'),
          tripPage('assets/images/two.jpg', 2, 4, 'Golden Gate Bridge',
              'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.')
        ],
      ),
    );
  }

  Widget tripPage(image, numberPage, totalPage, title, description) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.9),
          Colors.black.withOpacity(0.2)
        ], end: Alignment(0.3, 0.9), begin: Alignment.bottomRight)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _large ? 40 : (_medium ? 30 : 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    numberPage.toString(),
                    style: TextStyle(
                        fontSize: _large ? 40 : (_medium ? 36 : 32),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(
                        fontSize: _large ? 20 : (_medium ? 18 : 16),
                        color: Colors.white),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(1, titleUI(title)),
                    SizedBox(
                      height: _large ? 20 : (_medium ? 18 : 16),
                    ),
                    FadeAnimation(1.5, starsUI()),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        2,
                        Text(
                          description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontSize: _large ? 16 : (_medium ? 14 : 12),
                              height: 1.8),
                        )),
                    SizedBox(
                      height: _large ? 10 : (_medium ? 8 : 6),
                    ),
                    FadeAnimation(2.5, readMoreButton()),
                    SizedBox(
                      height: _large ? 10 : (_medium ? 8 : 6),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget readMoreButton() {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
        child: Text(
          'READ MORE',
          style: TextStyle(
              color: Colors.white, fontSize: _large ? 16 : (_medium ? 14 : 12)),
        ),
      ),
      onTap: () {
        print('click Read More');
      },
    );
  }

  Widget titleUI(title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: _large ? 40 : (_medium ? 36 : 32),
          fontWeight: FontWeight.bold),
    );
  }

  Widget starsUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: _large ? 16 : (_medium ? 14 : 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: _large ? 16 : (_medium ? 14 : 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: _large ? 16 : (_medium ? 14 : 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: _large ? 16 : (_medium ? 14 : 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.grey,
            size: _large ? 16 : (_medium ? 14 : 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                '4.0',
                style: TextStyle(
                    fontSize: _large ? 16 : (_medium ? 14 : 12),
                    color: Colors.white70),
              ),
              Text(
                '(' + 2000.toString() + ')',
                style: TextStyle(
                    fontSize: _large ? 12 : (_medium ? 10 : 8),
                    color: Colors.white38),
              )
            ],
          ),
        )
      ],
    );
  }
}
