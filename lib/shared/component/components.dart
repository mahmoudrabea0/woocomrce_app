

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
Widget defaultButton({
  Color color = Colors.indigo,
  String title,
  Function onpress
}) => Container(
  margin: EdgeInsets.all(20),
  width: double.infinity,
  height: 45,
  decoration: BoxDecoration(
    color:color ,
    borderRadius: BorderRadius.circular(15)
  ),
  child: FlatButton(
        onPressed: onpress,
    child: Text(
      title.toUpperCase(),
      style: TextStyle(color: Colors.white),
    ),
  ),
);

Widget logo()=> Container(
  padding: EdgeInsets.all(30),
      child: Image.asset(
          'assets/images/logo.png'
),
    );

Widget socailButtonLogin({
IconData iconData

}) => Padding(
  padding: const EdgeInsets.all(15.0),
  child:   CircleAvatar(
    radius: 20,
    backgroundColor: Colors.indigo,
    child: Icon(
     iconData,
      color: Colors.white,
    ),
  ),
);
void navigateto(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Widget edittextdefult({
  String text,
  TextEditingController controller,
  String hint,
  var keyboardtype
}) =>Container(
child: Container(
  margin: EdgeInsets.all(20),
  padding: EdgeInsetsDirectional.only(
    start: 10,
    end: 10,
    top: 10
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.white

  ),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      textofedittext(text: text.toUpperCase()),

      TextFormField(

        controller: controller,

        decoration: InputDecoration(

          border: InputBorder.none,

          hintText: hint

        ),
        keyboardType: keyboardtype,
      )



    ],

  ),
),
);

Widget textofedittext({
  String text

}) => Text(text,style: TextStyle(
  fontSize: 14
),);