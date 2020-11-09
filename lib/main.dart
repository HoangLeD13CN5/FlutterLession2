import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  double _width;
  double _height;
  double _ratio;

  void _onScroll() {
    print('scroll');
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 1)..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        ], stops: [
          0.3,
          0.9
        ], begin: Alignment.bottomRight)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    numberPage.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleUI(title),
                    SizedBox(
                      height: 20,
                    ),
                    starsUI(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 15,
                          height: 1.8),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    readMoreButton(),
                    SizedBox(
                      height: 10,
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
          style: TextStyle(color: Colors.white, fontSize: 15),
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
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
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
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.grey,
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                '4.0',
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
              Text(
                '(' + 2000.toString() + ')',
                style: TextStyle(fontSize: 12, color: Colors.white38),
              )
            ],
          ),
        )
      ],
    );
  }
}
