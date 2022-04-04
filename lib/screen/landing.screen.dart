import 'package:flutter/material.dart';
import 'register.screen.dart';
import 'login.screen.dart';
import 'package:ngontrakkan/helper/color.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'EuclidCircularA-Regular',
);

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.8, 0.9],
            colors: [
              HexColor("#F2F3C5"),
              HexColor("#F0F399"),
              HexColor("#F0F399"),
              HexColor("#F0F399"),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                    heightFactor: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset("assets/images/logos/startup.png",
                              width: 140, height: 140),
                        ),
                        Text('NgontraKan',
                            style: TextStyle(
                                color: HexColor("#6B707D"),
                                fontFamily: 'riesling',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 8,
                                fontSize: 61.0)),
                        Center(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                    'Cari kontrakkan murah disini tempatnya',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: HexColor("#6B707D"),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontSize: 15.0))))
                      ],
                    )),
                Center(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FlatButton(
                            minWidth: 200.0,
                            height: 40.0,
                            child: new Text("Login".toUpperCase(),
                                style: TextStyle(
                                    color: HexColor("#6B707D"),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                    fontSize: 14.0)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: HexColor("#6B707D"),
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ))),
                Center(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FlatButton(
                            minWidth: 200.0,
                            height: 40.0,
                            child: new Text("Sign up".toUpperCase(),
                                style: TextStyle(
                                    color: HexColor("#6B707D"),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                    fontSize: 14.0)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return SignupScreen();
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: HexColor("#6B707D"),
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}
