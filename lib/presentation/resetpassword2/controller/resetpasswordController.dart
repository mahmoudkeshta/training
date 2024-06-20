import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/presentation/resetpassword2/models/resetpassword1.dart';
import 'package:training/routes/app_routes.dart';

class ResetPas extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late r re;
String? email ;
  var isButtonEnabled = false.obs;
  late StatusRequest statusRequest;

  void checkIfButtonShouldBeEnabled() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  void resetPass() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await re.Verifica2(email!, passwordController.text);
    print('Response: $response');
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.homeContainerScreen);
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
  
      var arguments = Get.arguments;
    re = r(Get.find());
    email = Get.arguments['email'] ; // التأكد من صحة تحويل القيمة
    emailController.addListener(checkIfButtonShouldBeEnabled);
    passwordController.addListener(checkIfButtonShouldBeEnabled);
      super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
