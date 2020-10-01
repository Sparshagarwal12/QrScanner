import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intern/homePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              title: TextStyle(fontFamily: "Josefin"),
            ),
            color: Colors.white,
            centerTitle: true,
            elevation: 0.0),
        fontFamily: "Quicksand"),
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => MyHomePage()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 80, right: 80),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/splash2.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SpinKitFadingFour(
                        color: Colors.black, shape: BoxShape.rectangle))
              ],
            )));
  }
}
