import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/layout/cuibt/cubit.dart';
import 'package:woocomercapp/layout/cuibt/states.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Homecubit,HomeSates>(
        listener: (context ,state){
      
    },
        builder:(context,state){
          return Scaffold(
            body: Homecubit.get(context).wiget[Homecubit.get(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.score,),label: 'Courses'),
                BottomNavigationBarItem(icon: Icon(Icons.search,),label: 'Search',),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle,),label: 'Profile'),
                BottomNavigationBarItem(icon: Icon(Icons.settings,),label: 'Settings'),
              ],
              onTap: (index){
                  Homecubit.get(context).changeIndex(index);
              },
              currentIndex:Homecubit.get(context).currentindex ,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: defultButtonColor,
            ),

          );

        });
  }
}
