import 'package:shared_preferences/shared_preferences.dart';

class AddNewUser{
  Future<int> numberOfUsers() async {
    SharedPreferences users = await SharedPreferences.getInstance();
    int totalUsere = users.getInt('totalUsers')??0;
    return totalUsere;
  }
  Future<void> addingNewUser(String gotUsername, String gotPassword) async
  {
    String username="username", password='password';
    SharedPreferences users= await SharedPreferences.getInstance();
    int numberOfUser=await numberOfUsers();
    numberOfUser++;
    users.setString('username'+numberOfUser.toString(), gotUsername);
    users.setString('password'+numberOfUser.toString(),gotPassword);
    users.setInt('totalUsers', numberOfUser);

  }

}