import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/login/cubit/states.dart';
import 'package:woocomercapp/moduels/login/cubit/cubit.dart';
import '../../shared/component/components.dart';
import 'package:woocomercapp/shared/colors/colors_commn.dart';
import 'package:woocomercapp/layout/home.dart';
class login_screen extends StatelessWidget {
  String email ;
  String password;
  login_screen({this.email, this.password});
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (email != null && password != null){
      emailcontroller.text = email;
      passwordcontroller.text = password;

    }
    return BlocProvider(
      create: (BuildContext context) => logincubit(),
      child: BlocConsumer<logincubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginStateLoading)
            {
              buildProgress(
                context: context,
                text: 'please wait until creating an account ..',
              );
            }

            if (state is LoginStateSuccess)
            {
              Navigator.pop(context);
              saveToken(state.token).then((value)
              {
                if(value)
                {
                  //showToast(text: 'success save token', error: false,);
                  navigateAndFinish(context, Home_Screen());
                }
                else
                  showToast(text: 'error while saving a token', error: false,);
              });
            }

            if (state is LoginStateError)
            {
              Navigator.pop(context);
              print(state.error.toString());
              buildProgress(
                context: context,
                text: state.error.toString(),
                error: true,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Woocommerc App'),
                backgroundColor: defultButtonColor,
              ),
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      logo(),
                      edittextdefult(
                        controller: emailcontroller,
                        type: TextInputType.emailAddress,
                        hint: 'enter email',
                        title: 'Email',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      edittextdefult(
                        controller: passwordcontroller,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        hint: 'enter password',
                        title: 'Password',
                      ),
                      defaultButton(
                        function: () {
                          String email = emailcontroller.text;
                          String password = passwordcontroller.text;

                          if (
                              email.isEmpty ||
                              password.isEmpty
                          )
                          {
                            showToast(
                              text: 'please enter a valid data',
                              error: true,
                            );

                            return;
                          }
                          print(email+password);
                          logincubit.get(context).login(
                            email: email,
                            password: password,
                          );
                        },
                        text: 'login',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
