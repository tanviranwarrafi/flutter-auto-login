import 'package:auto_login/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Keep User Logged In'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: _isLoading
              ? Text('Wait..')
              : Column(
                  children: <Widget>[
                    SizedBox(height: 48.0),
                    Icon(Icons.lock_outline, size: 150.0, color: Colors.blue),
                    SizedBox(height: 48.0),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[100]),
                              ),
                            ),
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: _login,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ]),
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    /*RaisedButton(child: Text('Login'), onPressed: _login),*/
                  ],
                ),
        ),
      ),
    );
  }

  void _login() async {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      Future.delayed(Duration(seconds: 2), () async {
        if (_email.text == 'rafi@gmail.com' && _pass.text == '123') {
          setState(() {
            _isLoading = true;
          });

          /* Shared Preferences */
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isUser', true);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomePage()));
        }
      });
    }
  }
}
