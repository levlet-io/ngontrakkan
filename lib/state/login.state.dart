import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwtToken with ChangeNotifier, DiagnosticableTreeMixin {
  String _jwtToken = "";
  String? jwt;
  String get token => _jwtToken;

  void setToken(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    jwt = await prefs.getString("token");

    _jwtToken = jwt == null ? value : jwt;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('token', token));
  }
}