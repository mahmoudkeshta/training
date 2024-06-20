import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/Verification/controller/VerificationController.dart';
import 'package:training/presentation/Verifiy/controller/VerificationController.dart';
import 'package:training/core/utils/image_constant.dart';

class Verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Verifica controller = Get.put(Verifica());

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
                    'Verify Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontFamily: 'Lato',
                      fontSize: 64,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 102),
                  Text(
                    'Enter the 5-digit code sent to your phone',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        width: 40,
                        child: TextFormField(
                          controller: controller.codeControllers[index],
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 40),
                  Obx(() => ElevatedButton(
                    onPressed: controller.isButtonEnabled.value 
                      ? () {
                          controller.verifyCode();
                        }
                      : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Lato',
                      ),
                    ),
                  )),
                  SizedBox(height: 20),
                  Text(
                    'Didn\'t receive the code? Resend',
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
