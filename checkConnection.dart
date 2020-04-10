import 'package:connectivity/connectivity.dart';

class CheckConnection{
  Future<int> check_connection() async        //code 0=> no connection____; code 1=> Mobile data connection_____; code 2=> Wifi connection
  {
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      return 0;
    }
    else if(result==ConnectivityResult.mobile)
      {
        return 1;
      }
    else if(result==ConnectivityResult.wifi)
      {
        return 2;
      }
  }
}