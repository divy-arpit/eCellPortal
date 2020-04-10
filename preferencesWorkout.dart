import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefer {
  Future<int> numberOfUsers() async {
    SharedPreferences users = await SharedPreferences.getInstance();
    int totalUsere = users.getInt('totalUsers') ?? 0;
    return totalUsere;
  }

  Future<int> checkForUsername(String username, String password) async {
    //code 1=> username and password are correct
    int totalUsers =
        await numberOfUsers(); //code 2=>username correct and password wrong
    SharedPreferences users =
        await SharedPreferences.getInstance(); //code 3=> username wrong
    bool resultPassword;
    int i, j, result = 3;
    String s = "username", tempUsernameKey = "";
    if (totalUsers > 0) {
      for (i = 1;
          i <= totalUsers;
          i++) // If this loop gets completed=> user not found
      {
        tempUsernameKey = s + i.toString();
        if (username == users.getString(tempUsernameKey)) {
          resultPassword = await checkPassword(password, i);
          if (resultPassword) {
            result = 1;
          } else {
            result = 2;
          }
          break;
        }
      }
    }
    print('Return code is $result');
    return (result);
  }

  Future<bool> checkPassword(String password, int position) async {
    SharedPreferences usres = await SharedPreferences.getInstance();
    if (password == usres.getString('password' + position.toString()))
      return true;
    else
      return false;
  }
}
