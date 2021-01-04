import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/profile/cubit/cubit.dart';
import 'package:woocomercapp/moduels/profile/cubit/states.dart';
import 'package:woocomercapp/shared/component/components.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
class Profile_screen extends StatelessWidget {
  var data;
  var error="Something Went Wrong";
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=> Profilecubit()..getProfiledata(),
      child: BlocConsumer<Profilecubit,ProfileStates>(
        listener: (context,state){
          if(state is ProfileFailedState){
            error = state.error.toString();
          }

        },
        builder: (context,state) {
          data = Profilecubit.get(context).Profile;
       return ConditionalBuilder(
           condition: state is! ProfileFailedState,
           builder: (context) => ConditionalBuilder(
               condition: state is ProfileSuccessState,
               builder:(context)=>SingleChildScrollView(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Text(
                             "Profile",
                             style: TextStyle(fontSize: 34),
                           ),
                         ),
                       ],
                     ),
                     Container(
                       margin: EdgeInsets.all(16),
                       child: CircleAvatar(
                         radius: 65,
                         backgroundColor: defultButtonColor,
                         child: CircleAvatar(
                           radius: 60,
                           backgroundImage: NetworkImage(data['image']),
                         ),
                       ),
                     ),

                     Center(child: Container(child: Text(data['full_name'],style: TextStyle(fontSize: 30),))),
                     Center(child: Container(margin: EdgeInsets.all(16),child: Text(data['email'],style: TextStyle(fontSize: 18),))),
                     Row(
                       children: [
                         Expanded(
                           child: Column(
                             children: [
                               coursecontainer(icon:Icons.email,title: "Branding"),
                               coursecontainer(icon:Icons.email,title: "Branding"),
                               coursecontainer(icon:Icons.email,title: "Branding"),
                             ],
                           ),
                         ),
                         Expanded(
                           child: Column(
                             children: [
                               coursecontainer(icon:Icons.email,title: "Branding"),
                               coursecontainer(icon:Icons.email,title: "Branding"),
                               coursecontainer(icon:Icons.email,title: "Branding"),
                             ],
                           ),
                         ),

                       ],
                     )


                   ],
                 ),
               ),
             fallback: (context)=> Center(child: CircularProgressIndicator()),
           ),
         fallback: (context)=> Center(child: Text(error))
       );
        },
      ),
    );
  }
}
