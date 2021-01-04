import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/courses/cubit/states.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
import 'package:woocomercapp/shared/component/components.dart';

class Coursescubit extends Cubit<CoursesStates>{

  Coursescubit() : super(CoursesLoadingState());
  static Coursescubit get(context) => BlocProvider.of(context);
 List courses = [];
  getcourses(){
    DioHelper.postData(
      path: 'lms/api/v1/courses',
      token: getToken(),
    ).then((value){
      print(value.toString());
      courses = value.data['result']['data'];
      if (courses.isEmpty){
         emit(CoursesFailedState("No Courses Yet"));
         return;
      }
      emit(CoursesSuccessState());
    }).catchError((e){
      emit(CoursesFailedState("Something went wrong. Maybe No Internet Connection"));
      print(e);

    });
  }
}