import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/resetpassword2/models/resetpassword1.dart';

import 'package:training/routes/app_routes.dart';


class ResetPas extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
r re=r(Get.find());
String ? email;
  var isButtonEnabled = false.obs;
 late StatusRequest statusRequest;
  void checkIfButtonShouldBeEnabled() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  void resetPass() async{
  statusRequest = StatusRequest.loading;
    update();

    var response = await re.Verifica2(email!,passwordController.text);
 print('Response: $response'); 
    statusRequest = handlingData(response);
  Get.toNamed(AppRoutes.homeContainerScreen );
  /**
   * , arguments: {
          "users_email": emailCont.text,
        }
   */
       
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "Success") {
      
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Phone number already exists");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    emailController.addListener(checkIfButtonShouldBeEnabled);
    passwordController.addListener(checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
