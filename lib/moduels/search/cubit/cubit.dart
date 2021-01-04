import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/search/cubit/states.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
import 'package:woocomercapp/shared/component/components.dart';

class Searchcubit extends Cubit<SearchStates>{

  Searchcubit() : super(SearchinitialgState());
  static Searchcubit get(context) => BlocProvider.of(context);
 List courses = [];

  Search({String text}){
   emit(SearchLoadingState());
    DioHelper.postData(
      path: 'lms/api/v1/search',
      token: getToken(),
      data:
      {
        'q':'$text',
        'type':'1',

      },
    ).then((value){
      print(value.toString());
      courses = value.data['result']['data'];
      if(courses.length == 0){
        emit(SearchFailedState('No Courses Founded'));
        return;
      }
      emit(SearchSuccessState());
    }).catchError((e){
      emit(SearchFailedState("Something went wrong. Maybe No Internet Connection"));

    });
  }
}