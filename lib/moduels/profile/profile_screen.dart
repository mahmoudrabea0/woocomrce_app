import 'package:flutter/material.dart';
import 'package:woocomercapp/shared/component/components.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
class Profile_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Search Courses",
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
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                ),
              ),
            ),

            Container(child: Text("Name",style: TextStyle(fontSize: 30),)),
            Container(margin: EdgeInsets.all(16),child: Text("mahmud.rabea508@gmail.com",style: TextStyle(fontSize: 18),)),
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

    );
  }
}
