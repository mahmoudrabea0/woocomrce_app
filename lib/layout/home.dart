import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/layout/cuibt/cubit.dart';
import 'package:woocomercapp/layout/cuibt/states.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
import 'package:woocomercapp/shared/component/components.dart';
import 'package:woocomercapp/shared/network/cheackinternet/cubit/States.dart';
import 'package:woocomercapp/shared/network/cheackinternet/cubit/cubit.dart';
class Home_Screen extends StatelessWidget {
bool stat ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Internetcubit,InternetStates>(
      listener: (context , state){

           if(state is InternetSuccessState){
             stat = true;
           }else{
             stat = false;
           }
      },
      builder: (context , state){
        return BlocConsumer<Homecubit,HomeSates>(
            listener: (context ,state){
            },
            builder:(context,state){
              return Scaffold(
                appBar: defaultAppbar(),
                body:ConditionalBuilder(
                  condition: stat == true,
                  builder: (context)=>Homecubit.get(context).wiget[Homecubit.get(context).currentindex] ,
                  fallback: (context)=>Center(child: Text("No Internet Connection"))
                ),
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
      },

    );
  }
}
