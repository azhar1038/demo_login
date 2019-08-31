import 'package:flutter/material.dart';
import 'package:demo_login/pages/home.dart';
import 'package:demo_login/pages/login.dart';
import 'package:flutter/services.dart';

int r = 247, b = 160, g = 140;
Map<int, Color> color = {
  50:Color.fromRGBO(r, g, b, 0.1),
  100:Color.fromRGBO(r, g, b, 0.2),
  200:Color.fromRGBO(r, g, b, 0.3),
  300:Color.fromRGBO(r, g, b, 0.4),
  400:Color.fromRGBO(r, g, b, 0.5),
  500:Color.fromRGBO(r, g, b, 0.6),
  600:Color.fromRGBO(r, g, b, 0.7),
  700:Color.fromRGBO(r, g, b, 0.8),
  800:Color.fromRGBO(r, g, b, 0.9),
  900:Color.fromRGBO(r, g, b, 1),
};

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xfff78ca0, color),
      ),
      home: startApp(),
    );
  }

  Widget startApp() {
    if (isSigned())
      return HomePage(user: {'name':'no name'},);
    else
      return LoginPage();
  }

  bool isSigned() {
    return false;
  }
}
