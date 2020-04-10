import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecellproject/sign_up.dart';
import 'package:ecellproject/functions.dart';
import 'package:ecellproject/preferencesWorkout.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'dart:ui';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => Signup(),
      },
    ));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String enteredUsername, enteredPassword;
  TextEditingController tec = TextEditingController();
  TextEditingController tec2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login Page',
            style: TextStyle(
              wordSpacing: 3,
              letterSpacing: 3,
              fontSize: 25,
              fontFamily: 'Dacasa',
            ),
          ),
        ),
      ), //The title

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Dacasa',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //The LOGIN text

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Username',
                    ),
                  ],
                ),
              ),
              //Username Text
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                ),
                onChanged: (String username) {
                  setState(() {
                    enteredUsername = username;
                  });
                },
              ),
              //enter username here Text
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Password',
                    ),
                  ],
                ),
              ),
              //Password Text

              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (String password) {
                  setState(() {
                    enteredPassword = password;
                  });
                },
              ),
              //Enter Password Text
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Forgot password?',
                    ),
                  ),
                ],
              ),
              // Forgot Password Text
              FloatingActionButton.extended(
                  onPressed: () async {
                    Prefer prefer = Prefer();
                    int code = await prefer.checkForUsername(
                        enteredUsername, enteredPassword);

                    if (code == 1) {
                      Toast.show('Logged In', context,
                          duration: 2,
                          gravity: Toast.BOTTOM,
                          backgroundColor: Colors.grey);
                    } else if (code == 2) {
                      Toast.show('Wrong Password', context,
                          duration: 2,
                          gravity: Toast.BOTTOM,
                          backgroundColor: Colors.grey);
                    } else if (code == 3) {
                      Toast.show('User not found. Try signing up', context,
                          duration: 2,
                          gravity: Toast.BOTTOM,
                          backgroundColor: Colors.grey);
                    }
                  },
                  label: Text(
                      '                        Login                        ')),
              //Login Button

              Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    'Or Log in using',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )), // Or sign-up text

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipOval(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: FlatButton(
                              child: Image.asset('assets/hello.jpg')))),
                  ClipOval(
                      child: Container(
                          height: 90,
                          width: 90,
                          child: FlatButton(
                              child: Image.asset('assets/facebooklogo.png')))),
                  ClipOval(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: FlatButton(
                              child: Image.asset('assets/twitterlogo.png')))),
                ],
              ), // Contains the sign-in pics of google etc.

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'OR Sign Up',
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String message, {int duration, int gravity}) {}
} //this is the login widget tree
