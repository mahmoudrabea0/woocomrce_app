import 'package:flutter/material.dart';
import 'package:woocomercapp/shared/component/components.dart';
class Courses_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('courses'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  coursecontainer(icon:Icons.email,title: "Branding"),
                  coursecontainer(icon:Icons.email,title: "Branding"),
                  coursecontainer(icon:Icons.email,title: "Branding"),
              ],
              ),
            ),
            coursecontainer2(icon: Icons.star,title: "CSS", descreption: "Learn CSS for the first time or increase your knowledge as a web developer. "),
            coursecontainer2(icon: Icons.star,title: "CSS", descreption: "Learn CSS for the first time or increase your knowledge as a web developer. "),
            coursecontainer2(icon: Icons.star,title: "CSS", descreption: "Learn CSS for the first time or increase your knowledge as a web developer. "),
            coursecontainer2(icon: Icons.star,title: "CSS", descreption: "Learn CSS for the first time or increase your knowledge as a web developer. "),
            coursecontainer2(icon: Icons.star,title: "CSS", descreption: "Learn CSS for the first time or increase your knowledge as a web developer. "),
          ],
        ),
      ),
    );
  }
}
