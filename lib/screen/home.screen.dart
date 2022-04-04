import 'package:flutter/material.dart';
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/model/house_place.dart';
import 'package:ngontrakkan/screen/detail.screen.dart';
import 'package:ngontrakkan/screen/favorite.screen.dart';
import 'package:ngontrakkan/screen/main.screen.dart';
import 'package:ngontrakkan/screen/notification.screen.dart';
import 'package:ngontrakkan/screen/profile.screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          MainScreen(),
          NotificationScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home_outlined, size: 30.0),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.notifications_outlined, size: 30.0),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.favorite_outline, size: 30.0),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(2);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.person_outline, size: 30.0),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(3);
                  });
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: HexColor("#B7DED9"),
            child: Icon(
              Icons.search_sharp,
              size: 30.0,
              color: Colors.black,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    ));
  }
}
