import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';


import 'package:training/core/utils/image_constant.dart';
import 'package:training/presentation/signup/controller/LoginPage_controller.dart';

class signup1 extends StatelessWidget {
 // signup(find);

  @override
  Widget build(BuildContext context) {
    final LogController controller = Get.put(LogController());

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
                  SizedBox(height: 2),
                  Text(
                    'Create a new account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
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
                    ),
                  ),
                  SizedBox(height: 20),
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
                    ),
                  ),
                  SizedBox(height: 20),
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
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
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
                    ),
                  ),
                  SizedBox(height: 40),
                  GetBuilder<LogController>(
                    builder: (_) {
                      return ElevatedButton(
                        onPressed: controller.isButtonEnabled
                            ? () {
                                controller.goToSignUp();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Lato',
                          ),
                        ),
                        
                      );
                      
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Already have an account? Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: -1,
                child: Image.asset(ImageConstant.vector1),
              ),
              Positioned(
                bottom: 0,
                left: -275,
                child: Image.asset(ImageConstant.vector2),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
 
}
