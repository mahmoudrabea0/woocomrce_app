import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/courses/cubit/cubit.dart';
import 'package:woocomercapp/moduels/courses/cubit/states.dart';
import 'package:woocomercapp/shared/component/components.dart';
class Courses_screen extends StatelessWidget {
  var error;
  var courses;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> Coursescubit()..getcourses() ,
      child: BlocConsumer<Coursescubit, CoursesStates>(
        listener: (context , state){
          if(state is CoursesSuccessState){
            Coursescubit()..getcourses();
            courses = Coursescubit.get(context).courses;
          }
          if(state is CoursesFailedState){
            error = state.error.toString();
          }
      },builder: (context,state){
       courses = Coursescubit.get(context).courses;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Courses",
                  style: TextStyle(fontSize: 34),
                ),
              ),
             /* Container(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    coursecontainer(icon:Icons.email,title: "Branding"),
                    coursecontainer(icon:Icons.email,title: "Branding"),
                    coursecontainer(icon:Icons.email,title: "Branding"),
                  ],
                ),
              ),*/
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! CoursesLoadingState,
                  builder: (context) => ConditionalBuilder(
                    condition: state is CoursesSuccessState,
                    builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: 1.0,
                      ),
                      itemBuilder: (context, index) =>
                          coursecontainer2(courses[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                      itemCount: courses.length,
                    ),
                    fallback: (context)=> ConditionalBuilder(
                        condition: state is CoursesFailedState,
                        builder: (context) => Center(child: Text(error)),
                        fallback: (context) => Center(child: Text("Courses Here..."))
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          );
      },

      ),
    );
  }
}
