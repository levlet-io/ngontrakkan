import 'package:flutter/material.dart';
import 'package:ngontrakkan/helper/color.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ngontrakkan/state/login.state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ngontrakkan/screen/landing.screen.dart';

Future<Profile> profile_fetch(token) async {

  var parameter = {
    'token': '${token}',
  };

  final response = await http.get(Uri.http('api-ngontrakkan.levlet.io', '/api/v1/profile', parameter));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('failed to load profile');
  }
}


class Profile {
  final String name;
  final String email;

  Profile({required this.name, required this.email});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      name: json['name']
    );
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {

  void logout_try() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LandingScreen();
    }));
  }

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
                  child: Text('Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontSize: 15.0))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: FutureBuilder<Profile>(
                      future: profile_fetch(Provider.of<JwtToken>(context, listen: false).token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('Hi, ${snapshot.data!.name} how are you ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 13.0));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 13.0));
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    ),
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
            child: Column(
              children: [
                Card(
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
                          child: Icon(Icons.person_sharp, color: Colors.black, size: 50),
                        ),
                        title: FutureBuilder<Profile>(
                          future: profile_fetch(Provider.of<JwtToken>(context, listen: false).token),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text('This your email, ${snapshot.data!.email}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 13.0));
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 13.0));
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.info_outline, color: Colors.blue),
                            Text(" ngontrakkan member",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600 ))
                          ],
                        ),
                        trailing: Icon(Icons.perm_device_info,
                            color: Colors.black, size: 30.0)),
                  ),
                ),
                Card(
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
                          child: Icon(Icons.logout, color: Colors.black, size: 50),
                        ),
                        title: FutureBuilder<Profile>(
                          future: profile_fetch(Provider.of<JwtToken>(context, listen: false).token),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text('Hi, ${snapshot.data!.name} here for logout',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 13.0));
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 13.0));
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                        onTap: () => logout_try(),
                        trailing: Icon(Icons.login_outlined,
                            color: Colors.black, size: 30.0)),

                  ),
                )
              ],
            )
        ),
      ),
    ));
  }
}
