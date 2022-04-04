import 'package:flutter/material.dart';
import 'screen/landing.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:ngontrakkan/state/login.state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ngontrakkan/screen/home.screen.dart';

String? jwt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  jwt = await prefs.getString("token");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => JwtToken()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ngontrakkan',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.light, fontFamily: 'EuclidCircularA-Regular',),
      theme: ThemeData(
          fontFamily: 'EuclidCircularA-Regular',
          colorScheme: ColorScheme.light()
      ),
      initialRoute: jwt == null ? "login" : "/",
      routes: {
        '/': (context) => HomeScreen(),
        "login": (context) => LandingScreen(),
      },
    );
  }
}