import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecellproject/addNewUser.dart';
import 'package:toast/toast.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String receivedUsername, receivedPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SignUp Page',
          style: TextStyle(
            fontFamily: 'dacasa',
            wordSpacing: 3,
            letterSpacing: 3,
            fontSize: 25,
          ),
        ),
      ), // SignUp page Text
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'SignUp',
                      style: TextStyle(
                        fontFamily: 'Dacasa',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ), // SignUp Text

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Enter New Username',
                    ),
                  ],
                ),
              ), // Text Enter New Username
              TextField(
                onChanged: (String username) {
                  receivedUsername = username;
                },
                decoration: InputDecoration(
                  hintText: 'Choose your username',
                ),
              ),
//enter new username here Text
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'New Password',
                    ),
                  ],
                ),
              ),
//New Password Text

              TextField(
                decoration: InputDecoration(
                  hintText: 'Choose your password',
                ),
                onChanged: (String password) {
                  receivedPassword = password;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: FloatingActionButton.extended(
                    onPressed: () {
                      AddNewUser newUser = AddNewUser();
                      newUser.addingNewUser(receivedUsername, receivedPassword);
                      Toast.show('SignedUp Successfully \n       Login again ', context,duration: 3,backgroundColor: Colors.grey);

                      Navigator.pop(context);
                    },
                    label: Text(
                        '                        SignUp                        ')),
              ),
//SignUp Button
            ],
          ),
        ),
      ),
    );
  }
}
