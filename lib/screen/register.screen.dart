import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ngontrakkan/helper/color.dart';
import 'package:ngontrakkan/state/login.state.dart';
import 'package:ngontrakkan/screen/login.screen.dart';
import 'package:ngontrakkan/widget/bezier.container.dart';
import 'package:shared_preferences/shared_preferences.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'EuclidCircularA-Regular',
);

class SignupScreen extends StatefulWidget {
  SignupScreen({key}) : super(key: key);

  @override
  SignupState createState() => new SignupState();
}

class ApiResponse {
  bool status;
  String error;

  ApiResponse(this.status, this.error);

  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(json['status'] as bool, json['error'] as String);
  }

  @override
  String toString() {
    return '{ ${this.status}, ${this.error }';
  }
}

class SignupState extends State<SignupScreen> {
  String _email = '';
  String _password = '';
  String _name = '';
  String _error_email = '';
  bool _disabled = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();


  Future<String> submit_register() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://api-ngontrakkan.levlet.io/api/v1/register"));
    request.fields['email'] = _email;
    request.fields['name'] = _name;
    request.fields['password'] = _password;
    var res = await request.send();

    var response = await res.stream.bytesToString();

    String _response = response;

    return _response;
  }

  void submit_button() async {
    // validate will return true if the form is valid, or false if
    // the form is invalid.
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _disabled = true;
    });

    if (_formKey.currentState!.validate()) {
      submit_register().then((value) {
        setState(() {
          _disabled = false;
        });
        ApiResponse response = ApiResponse.fromJson(jsonDecode(value));

        print(value);

        final snackBar = SnackBar(content: Text('Yay, successfully register account, please login',
            style: TextStyle(
                fontFamily: 'EuclidCircularA-Regular',
            )));

        if (response.status) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          _formKey.currentState?.reset();
          // prefs.setString('token', response.token);
          // Provider.of<JwtToken>(context, listen: false).setToken(response.token);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }));
        } else {
          setState(() {
            _error_email = response.error;
          });
        }
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
                              Text('Sign up',
                                  style: TextStyle(
                                      color: HexColor("#6B707D"),
                                      fontFamily: 'riesling',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 8,
                                      fontSize: 61.0)),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    setState(() {
                                      _name = value;
                                    });
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(10.0),
                                        ),
                                      ),
                                      fillColor: HexColor("#C5C5C5"),
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: HexColor("#B7DED9"), width: 2.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          )
                                      ),
                                      hintText: "Please write your name",
                                      filled: true),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Hi, nice to meet you. whats is your name?';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
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
                                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(10.0),
                                        ),
                                      ),
                                      fillColor: HexColor("#C5C5C5"),
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: HexColor("#B7DED9"), width: 2.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          )
                                      ),
                                      hintText: "Please write your email",
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
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
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
                                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(10.0),
                                        ),
                                      ),
                                      fillColor: HexColor("#C5C5C5"),
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: HexColor("#B7DED9"), width: 2.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          )
                                      ),
                                      hintText: "Please write your password",
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: FlatButton(
                                  minWidth: 120.0,
                                  height: 40.0,
                                  child: new Text("Ok, ready",
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
                                  onPressed: _disabled ? null : () => submit_button(),
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
