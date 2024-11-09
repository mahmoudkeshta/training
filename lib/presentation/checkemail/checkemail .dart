import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/checkemail/controller/LoginPage_controller.dart';
import 'package:training/core/utils/image_constant.dart';

class CheckEmailPage extends StatelessWidget {
  final CheckEmail controller = Get.put(CheckEmail());

 CheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 144),
                  const Text(
                    'Check Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontFamily: 'Lato',
                      fontSize: 64,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 102),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const Text(
                          'Enter your email address',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: controller.emailCont,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) =>
                              controller.checkIfButtonShouldBeEnabled(),
                        ),
                        const SizedBox(height: 40),
                        Obx(() => ElevatedButton(
                              onPressed: controller.isButtonEnabled.value
                                  ? () => controller.checkEmail()
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
                                'Check Email',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            )),
                      ],
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
