import 'package:flutter/material.dart';
import '../../shared/component/components.dart';
import 'package:woocomercapp/moduels/welcome/welcome_screen.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
class login_screen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Woocommerc App'),backgroundColor: defultButtonColor,),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              edittextdefult(text: 'email',controller:emailcontroller,hint: 'email' ,keyboardtype: TextInputType.emailAddress),
              edittextdefult(text: 'password',controller:passwordcontroller,hint: 'password',keyboardtype: TextInputType.name),
              defaultButton(color: defultButtonColor,title: 'login',onpress: (){
                navigateto(context, Welcome_screen());
                print(emailcontroller.text + passwordcontroller.text);
              })
            ],
          ),
        ),
      ),
    );
  }
}