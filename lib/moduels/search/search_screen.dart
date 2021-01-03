import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/search/cubit/cubit.dart';
import 'package:woocomercapp/moduels/search/cubit/states.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
import 'package:woocomercapp/shared/component/components.dart';

class Search_screen extends StatelessWidget {
  var error;
  var courses;
  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Searchcubit(),
      child:
          BlocConsumer<Searchcubit, SearchStates>(listener: (context, state) {
                 if(state is SearchFailedState){
                   error = state.error.toString();
                 }
             },
              // ignore: missing_return
              builder: (context, state) {
                courses = Searchcubit.get(context).courses;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Search Courses",
                style: TextStyle(fontSize: 34),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 50,
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(start: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'search...'),
                        keyboardType: TextInputType.text,
                        controller: searchcontroller,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: defultButtonColor,
                        ),
                        height: 60,
                        child: IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {
                            String m = searchcontroller.text;
                            Searchcubit.get(context).Search(text: m);

                          },
                        ))
                  ],
                ),
              ),
            ),
            /*  Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      coursecontainer(icon: Icons.email, title: "Branding"),
                      coursecontainer(icon: Icons.email, title: "Branding"),
                      coursecontainer(icon: Icons.email, title: "Branding"),
                    ],
                  ),
                ),*/
            Expanded(
              child: ConditionalBuilder(
                condition: state is! SearchLoadingState,
                builder: (context) => ConditionalBuilder(
                  condition: state is SearchSuccessState,
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
                      condition: state is SearchFailedState,
                      builder: (context) => Center(child: Text(error)),
                      fallback: (context) => Center(child: Text("Search Here..."))
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        );
      }),
    );
  }
}
