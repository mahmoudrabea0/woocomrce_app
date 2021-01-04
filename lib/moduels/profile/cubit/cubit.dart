import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/profile/cubit/states.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
import 'package:woocomercapp/shared/component/components.dart';

class Profilecubit extends Cubit<ProfileStates>{

  Profilecubit() : super(ProfileLoadingState());
  static Profilecubit get(context) => BlocProvider.of(context);
 var Profile;
  getProfiledata(){
    DioHelper.postData(
      path: 'lms/api/v1/my-account',
      token: getToken(),
    ).then((value){
      print(value.toString());
      Profile = value.data['result'];
      if (Profile.isEmpty){
         emit(ProfileFailedState("No Profile Yet"));
         return;
      }
      emit(ProfileSuccessState());
    }).catchError((e){
      emit(ProfileFailedState("Something went wrong. Maybe No Internet Connection"));
      print(e);

    });
  }
}