import 'package:woocomercapp/moduels/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
class logincubit extends Cubit<LoginStates>{

  logincubit() : super(LoginStateInitial());
  static logincubit get(context) => BlocProvider.of(context);
  login({ email , password}){
     emit(LoginStateLoading());

     DioHelper.postData(
       path: 'lms/oauth/token',
       data:
     {
       'grant_type':'password',
       'client_secret':'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
     'client_id':'1',
       'username':'$email',
       'password':'$password',

     },
     ).then((value){
       print(value.toString());
       emit(LoginStateSuccess(value.data['access_token']));
       
     }).catchError((e){
       emit(LoginStateError(e));
     });
    
  }

}