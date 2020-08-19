import 'package:flutter/material.dart';
import 'package:intern/generate.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result;
  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();

      await setState(() {
        result = cameraScanResult;
        // setting string result with cameraScanResult
      });
      _launchInBrowser(result);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  bool boo = false;
  bool boo2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenerateScreen()),
                    );

                    if (boo == false && boo2 == true) {
                      setState(() {
                        boo = true;
                        boo2 = false;
                      });
                    } else if (boo == false && boo2 == false) {
                      setState(() {
                        boo = true;
                      });
                    }
                  },
                  child: boo == true
                      ? Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10.0,
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40.0),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF00b09b),
                                Color(0xFF00b09b),
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          height: 170,
                          width: 200,
                          child: Center(
                              child: Text(
                            "Generate",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )))
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFf80759),
                                Color(0xFFbc4e9c),
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          height: 170,
                          width: 200,
                          child: Center(
                              child: Text(
                            "Generate",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))))),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
                onTap: () {
                  _scanQR();
                  if (boo2 == false && boo == true) {
                    setState(() {
                      boo2 = true;
                      boo = false;
                    });
                  } else if (boo2 == false && boo == false) {
                    setState(() {
                      boo2 = true;
                    });
                  }
                },
                child: boo2 == true
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF00b09b),
                              Color(0xFF00b09b),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                        ),
                        height: 170,
                        width: 200,
                        child: Center(
                            child: Text(
                          "SCAN",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFf80759),
                              Color(0xFFbc4e9c),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                        ),
                        height: 170,
                        width: 200,
                        child: Center(
                            child: Text(
                          "SCAN",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )))),
          )
        ],
      ),
    );
  }
}
