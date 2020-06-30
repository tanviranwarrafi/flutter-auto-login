import 'package:auto_login/home.dart';
import 'package:auto_login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isUser = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(isUser),
    );
  }

  void _initCheck() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser');
      });
    }
  }

}

class SplashPage extends StatefulWidget {

  final bool isUser;
  SplashPage(this.isUser);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => widget.isUser ? HomePage() : LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Load App...'),
          ],
        ),
      ),
    );
  }
}
