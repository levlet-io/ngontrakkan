import 'package:flutter/material.dart';
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/model/house_place.dart';
import 'package:ngontrakkan/screen/detail.screen.dart';
import 'package:ngontrakkan/screen/home.screen.dart';
import 'package:ngontrakkan/screen/favorite.screen.dart';
import 'package:ngontrakkan/screen/profile.screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationScreen();
  }
}

class _NotificationScreen extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: HexColor("#B7DED9"),
              title: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Notification',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            fontSize: 15.0))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: Text('you have 1 notification',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 13.0)),
                      onTap: () {
                        print("tapped subtitle");
                      },
                    ))
              ]),
              titleSpacing: 28.0,
              centerTitle: false,
              toolbarHeight: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              elevation: 0.00,
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 8.0,
                  margin:
                  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Container(
                    decoration:
                    BoxDecoration(color: HexColor("#B7DED9")),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.black))),
                          child: Icon(Icons.autorenew, color: Colors.black),
                        ),
                        title: Text(
                          "Refund booking for apartement",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.notification_important_outlined, color: Colors.red),
                            Text(" Urgent",
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 30.0)),
                  ),
                )
              ),
            )));
  }
}
