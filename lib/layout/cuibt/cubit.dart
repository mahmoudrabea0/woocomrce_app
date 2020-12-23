import 'package:woocomercapp/layout/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/courses/courses_screen.dart';
import 'package:woocomercapp/moduels/profile/profile_screen.dart';
import 'package:woocomercapp/moduels/search/search_screen.dart';
import 'package:woocomercapp/moduels/setting/setting_screen.dart';
class Homecubit extends Cubit<HomeSates>{
 var wiget = [
   Courses_screen(),
   Search_screen(),
   Profile_screen(),
   Setting_screen(),

 ];
  Homecubit() : super(HomeStateinitial());
  static Homecubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  changeIndex( index){
    currentindex = index;
    emit(HomeStateindex());

  }


}