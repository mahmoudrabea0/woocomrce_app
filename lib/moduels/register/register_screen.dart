import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomercapp/moduels/login/login_screen.dart';

import '../../shared/component/components.dart';
import 'package:woocomercapp/moduels/register/cubit/cubit.dart';
import 'package:woocomercapp/moduels/register/cubit/states.dart';

import 'package:woocomercapp/shared/colors/colors_commn.dart';
class Register_screen extends StatelessWidget {
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context,state){
        if (state is RegisterStateLoading)
        {
          buildProgress(
            context: context,
            text: 'please wait until creating an account ..',
          );
        }

        if (state is RegisterStateSuccess)
        {
          navigateAndFinish(
            context,
            login_screen(email: emailController.text, password:  passwordController.text,),
          );
        }

        if (state is RegisterStateError)
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
          builder:(context,state){
       return Scaffold(
          appBar: AppBar(title: Text('Woocommerc App'),backgroundColor: defultButtonColor,),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  logo(),
                  edittextdefult(
                    controller: firstController,
                    type: TextInputType.name,
                    hint: 'enter first name',
                    title: 'First Name',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  edittextdefult(
                    controller: lastController,
                    type: TextInputType.name,
                    hint: 'enter last name',
                    title: 'Last Name',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  edittextdefult(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hint: 'enter email',
                    title: 'Email',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  edittextdefult(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    hint: 'enter password',
                    title: 'Password',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  edittextdefult(
                    controller: cityController,
                    type: TextInputType.text,
                    hint: 'enter city',
                    title: 'City',
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultButton(
                    function: () {
                      String firstName = firstController.text;
                      String lastName = lastController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String city = cityController.text;

                      if (firstName.isEmpty ||
                          lastName.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          city.isEmpty)
                      {
                        showToast(
                          text: 'please enter a valid data',
                          error: true,
                        );

                        return;
                      }
                      print(firstName+lastName+email+password+city);
                      RegisterCubit.get(context).register(
                        first: firstName,
                        last: lastName,
                        email: email,
                        password: password,
                        city: city,
                      );
                    },
                    text: 'register',
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