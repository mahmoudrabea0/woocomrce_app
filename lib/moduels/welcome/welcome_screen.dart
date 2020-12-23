import 'package:flutter/material.dart';
import 'package:woocomercapp/moduels/register/register_screen.dart';
import '../../shared/component/components.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
import 'package:woocomercapp/moduels/login/login_screen.dart';

class Welcome_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woocommerc App'),
        backgroundColor: defultButtonColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            logo(),
            defaultButton(
              text: 'login',
              function: ()
              {
                navigateTo(context, login_screen());
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: defaultButton(
                text: 'register',
                function: ()
                {
                  navigateTo(context, Register_screen());

                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Text("Or Sign With ?")),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socailButtonLogin(iconData: Icons.account_circle),
                socailButtonLogin(iconData: Icons.image)
              ],
            )
          ],
        ),
      ),
    );
  }
}
