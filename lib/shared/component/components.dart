import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
import 'package:woocomercapp/shared/network/remote/dio_helper.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

Widget defaultButton({
  Color background = defultButtonColor,
  double radius = 5.0,
  @required Function function,
  @required String text,
  bool toUpper = true,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

SharedPreferences preferences;

void initApp() {
  DioHelper();
}

Future<void> initPref() async {
  preferences = await SharedPreferences.getInstance();
}

Future<bool> saveToken(String token) => preferences.setString('token', token);

Future<bool> removeToken() => preferences.remove('token');

String getToken() => preferences.getString('token');
Widget logo() => Container(
      padding: EdgeInsets.all(30),
      child: Image.asset('assets/images/logo.png'),
    );

Widget socailButtonLogin({IconData iconData}) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.indigo,
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
void navigateto(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Widget edittextdefult({
  String title,
  String hint = '',
  bool isPassword = false,
  @required TextEditingController controller,
  @required TextInputType type,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
        top: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) detailsText(title),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: type,
          ),
        ],
      ),
    );
Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );

Widget textofedittext({String text}) => Text(
      text,
      style: TextStyle(fontSize: 14),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              SizedBox(
                height: 20.0,
              ),
            if (error)
              defaultButton(
                function: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

Widget defaultAppbar() => AppBar(
      elevation: 0.0,
      backgroundColor: defultColor,
      actions: [
// action button
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: appbaritems,
          ),
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: appbaritems,
        ),
        onPressed: () {},
      ),
    );

// courses containers

Widget coursecontainer({IconData icon, String title, Function onpress}) =>
    Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3))
            ]),
        margin: EdgeInsets.all(16),
        height: 155,
        width: 155,
        child: GestureDetector(
          onTap: onpress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: defultButtonColor),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));

Widget coursecontainer2(
       course) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0,),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius:5,
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0,),
        child: ExpansionTileCard(
          trailing: Text(""),
          baseColor: Colors.white,
          expandedColor: Colors.white,
          elevation: 0.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25.0,
                child: Image.network(course['image']),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            course['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 10.0,
                          ignoreGestures: true,
                          itemPadding: EdgeInsets.zero,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating)
                          {
                            print(rating);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                     course['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ],
                ),
              ),
            ],
          ),
          onExpansionChanged: (value)
          {

          },
          children: <Widget>[
            Text('test'),
          ],
        ),
      ),
    );

Widget buildSettingItem({@required title,@required function}) => Column(
  children: [
    SizedBox(
      height: 1.0,
    ),
    ListTile(
      tileColor: Colors.white,
      onTap: function,
      title: Text(
        title.toString(),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.0,
      ),
    ),
  ],
);