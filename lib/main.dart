import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/layout/cuibt/cubit.dart';
import 'package:woocomercapp/shared/network/cheackinternet/cubit/cubit.dart';
import 'moduels/welcome/welcome_screen.dart';
import 'package:woocomercapp/layout/home.dart';
import 'package:woocomercapp/moduels/welcome/welcome_screen.dart';
import 'shared/component/components.dart';
import 'shared/colors/colors_commn.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  var widget;

  await initPref().then((value)
  {
    if(getToken() != null && getToken().length > 0)
    {
      print('---- token exist');
      widget = Home_Screen();
    }
    else
    {
      print('---- token not exist');
      widget = Welcome_screen();
    }
  });

  runApp(MyApp(widget));

}

class MyApp extends StatelessWidget {
  var widget;

  MyApp(this.widget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initApp();
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (context) => Homecubit(),

        ),
        BlocProvider(
          create: (context) => Internetcubit()..getconection(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          scaffoldBackgroundColor: defultColor,
          primarySwatch: Colors.blue,
        ),
        home: widget,
      ),
    );
  }
}

