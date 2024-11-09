import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:training/presentation/checkemail/models/Verification.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/routes/app_routes.dart';

abstract class CheckEmailCont extends GetxController {
  Future<void> signUp();
  checkemail ch=checkemail(Get.find());
checkEmail();
late String email;
}

class CheckEmail extends CheckEmailCont {
  

  late TextEditingController emailCont;
  
  late checkemail Checkemail;

  var isButtonEnabled = false.obs;

  List data = [];
late StatusRequest statusRequest;
  @override
  void onInit() {
    super.onInit();
    emailCont = TextEditingController();
    emailCont.addListener(checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    emailCont.dispose();
    super.onClose();
  }

  @override
 checkEmail() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ch.check(emailCont.text);
 print('Response: $response'); 
    statusRequest = handlingData(response);
    
  
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "Success") {
      Get.toNamed(AppRoutes.Verify1, arguments:{
          "email":  emailCont.text,
        });
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
  Future<void> signUp() async {
    // Implement your sign-up logic here
  }

  void checkIfButtonShouldBeEnabled() {
    isButtonEnabled.value = emailCont.text.isNotEmpty;
  }
}
