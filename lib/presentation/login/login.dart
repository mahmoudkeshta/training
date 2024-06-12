import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:training/core/app_export.dart';
import 'package:training/presentation/home_page/home_page.dart';
import 'package:training/presentation/login/controller/login_controller.dart';
import 'package:training/presentation/signup/controller/LoginPage_controller.dart';
import 'package:training/presentation/signup/models/crud.dart';
import 'package:training/presentation/signup/models/signup.dart';
import 'package:training/presentation/signup/sign_up.dart';
import 'package:training/presentation/login/controller/login_controller.dart';

class LoginP extends StatelessWidget {
  final LogController1 controller = Get.put(LogController1());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: 144),
                  Text(
                    'Hello',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 64,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign in to your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 67),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(199, 199, 199, 1),
                                fontFamily: 'Lato',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(199, 199, 199, 1),
                                fontFamily: 'Lato',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(190, 190, 190, 1),
                        fontFamily: 'Lato',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    onTap: (){
                      controller.forgetpassword();
                    },
                  ),
                  SizedBox(height: 40),
                  GetBuilder<LogController1>(
                    builder: (_) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.goToSignUp1();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Lato',
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Text(
                      'Don’t have an account? Create',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(38, 38, 38, 1),
                        fontFamily: 'Lato',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.sign_up);
                    },
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 290,
                child: Lottie.asset(ImageConstant.m,addRepaintBoundary: true),//Image.asset(ImageConstant.vector1),
              
              ),
               Positioned(
                top: 0,
                left: -1,
                child:Image.asset(ImageConstant.vector1),
              
              )
              // Uncomment and fix the positioning if needed
              // Positioned(
              //   bottom: 0,
              //   left: -275,
              //   child: Image.asset(ImageConstant.vector2),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
