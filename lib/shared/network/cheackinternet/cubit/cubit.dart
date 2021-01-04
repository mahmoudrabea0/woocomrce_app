import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/shared/network/cheackinternet/cubit/States.dart';

class Internetcubit extends Cubit<InternetStates>{
  Internetcubit() : super(InternetStateInitial());
  static Internetcubit get(context) => BlocProvider.of(context);
  StreamSubscription connectivitySubscription;
  getconection() async{

    print("intial");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        emit(InternetSuccessState());
      } else if (connectivityResult == ConnectivityResult.wifi) {
        emit(InternetSuccessState());
      }else{
        emit(InternetFailedState());
      }
    connectivitySubscription = Connectivity()
        .onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        emit(InternetSuccessState());

        print("succes1");
      }
      else if (connectivityResult == ConnectivityResult.wifi) {
        emit(InternetSuccessState());

        print("succes2");
      } else if (connectivityResult == ConnectivityResult.none){
       emit(InternetFailedState());

       print("faild");
      }
    });
  }
}