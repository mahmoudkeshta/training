import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';


import 'package:training/core/utils/image_constant.dart';
import 'package:training/presentation/signup/controller/LoginPage_controller.dart';

class signup1 extends StatelessWidget {
  const signup1({super.key});

 // signup(find);

  @override
  Widget build(BuildContext context) {
    final LogController controller = Get.put(LogController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 144),
                  const Text(
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
                  const SizedBox(height: 2),
                  const Text(
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
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(
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
                  const SizedBox(height: 40),
                  GetBuilder<LogController>(
                    builder: (_) {
                      return ElevatedButton(
                        onPressed: controller.isButtonEnabled
                            ? () {
                                controller.goToSignUp();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Lato',
                          ),
                        ),
                        
                      );
                      
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
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
