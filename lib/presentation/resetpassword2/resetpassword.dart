import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/utils/image_constant.dart';

import 'package:training/presentation/resetpassword2/controller/resetpasswordController.dart';

class ResetPasswordPage extends StatelessWidget {
      final ResetPas co = Get.put(ResetPas());

 ResetPasswordPage({super.key});


  @override
  Widget build(BuildContext context) {
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
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 64,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 102),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const Text(
                          'Enter your email and new password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(38, 38, 38, 1),
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: co.emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: co.passwordController,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),
                        Obx(() => ElevatedButton(
                          onPressed: co.isButtonEnabled.value
                              ? () => co.resetPass()
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Lato',
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Didn\'t receive an email? Resend',
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
            ],
          ),
        ),
      ),
    );
  }
}