
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/register/cubit/states.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterStateInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  register({first , last , email , password,city}){
     emit(RegisterStateLoading());
     print(first + last+ email+ password+ city+"{ايه ده ؟}");
     DioHelper.postData(
       path: 'lms/api/v1/auth/signup-save',
       data:
     {
       'first_name':'$first',
       'last_name':'$last',
       'email':'$email',
       'password':'$password',
       'city':'$city',
     },
     ).then((value){
       print(value.toString());
       emit(RegisterStateSuccess());
       
     }).catchError((e){
       print(e.toString());
       emit(RegisterStateError(e.toString()));
     });
    
  }

}