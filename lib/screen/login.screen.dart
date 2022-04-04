import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/widget/bezier.container.dart';
import 'package:ngontrakkan/state/login.state.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ngontrakkan/screen/intro.screen.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'EuclidCircularA-Regular',
);

class LoginScreen extends StatefulWidget {
  LoginScreen({key}) : super(key: key);

  @override
  LoginState createState() => new LoginState();
}

class ApiResponse {
  bool status;
  String token;
  String error;

  ApiResponse(this.status, this.token, this.error);

  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(json['status'] as bool, json['data']['token'] as String, json['error'] as String);
  }

  @override
  String toString() {
    return '{ ${this.status}, ${this.token}, ${this.error }';
  }
}

class LoginState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  String _errorEmail = '';
  bool _disabled = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  Future<String> submit_login() async {

    print(_email);
    print(_password);

    var request = http.MultipartRequest(
        'POST', Uri.parse("http://api-ngontrakkan.levlet.io/api/v1/login"));
    request.fields['username'] = _email;
    request.fields['password'] = _password;
    var res = await request.send();

    if (res.statusCode == 201) {
      var response = await res.stream.bytesToString();
      String _response = response;

      return _response;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login.');
    }
  }

  void submit_button() async {
    // validate will return true if the form is valid, or false if
    // the form is invalid.
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _disabled = true;
    });

    if (_formKey.currentState!.validate()) {
      submit_login().then((value) {
        setState(() {
          _disabled = false;
        });
        setState(() {
          _errorEmail = "";
        });
        ApiResponse response = ApiResponse.fromJson(jsonDecode(value));

        if (response.status == true) {
          prefs.setString('token', response.token);
          Provider.of<JwtToken>(context, listen: false).setToken(response.token);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return IntroScreen();
          }));
        } else {
          print(response.error);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Sorry"),
                content: Text("${response.error}"),
              );;
            },
          );
          setState(() {
            _errorEmail = response.error;
          });
        }
      }).catchError((error, stackTrace) {
        // error is SecondError
        print("outer: $error");
        setState(() {
          _disabled = false;
        });
      });
    } else {
      setState(() {
        _disabled = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background/ngontrakk-register-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                SafeArea(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        color: HexColor("#6B707D"),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text("Back",
                          style: TextStyle(
                              color: HexColor("#6B707D"),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              fontSize: 15.0)),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
                    child: Center(
                        child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Sign In',
                              style: TextStyle(
                                  color: HexColor("#6B707D"),
                                  fontFamily: 'riesling',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 8,
                                  fontSize: 61.0)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TextFormField(
                              onChanged: (String value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  fillColor: HexColor("#C5C5C5"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: HexColor("#B7DED9"),
                                          width: 2.0),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      )),
                                  hintText: "Please enter your email",
                                  filled: true),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hi, where is your email';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TextFormField(
                              onChanged: (String value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  fillColor: HexColor("#C5C5C5"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: HexColor("#B7DED9"),
                                          width: 2.0),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      )),
                                  hintText: "Please enter your password",
                                  filled: true),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ops, did you forget the password?';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: FlatButton(
                              minWidth: 120.0,
                              height: 40.0,
                              child: _disabled
                                  ? SizedBox(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.blue)),
                                      height: 25.0,
                                      width: 25.0,
                                    )
                                  : Text("Ok, let me in",
                                      style: TextStyle(
                                          color: HexColor("#6B707D"),
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2,
                                          fontSize: 14.0)),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: HexColor("#6B707D"),
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed:
                                  _disabled ? null : () => submit_button(),
                            ),
                          ),
                        ],
                      ),
                    ))),
              ],
            ),
          ),
        ));
  }
}
