import 'dart:async';
import 'package:connectivity/connectivity.dart';
Future<bool> getconection() async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return Future<bool>.value(true);
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return Future<bool>.value(true);
  }else{
    return Future<bool>.value(false);
  }
}