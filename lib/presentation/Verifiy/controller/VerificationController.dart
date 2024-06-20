import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:training/presentation/Verification/models/Verification.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class Verifica extends GetxController {
  String? email;
  late Verification verification;
  late StatusRequest statusRequest;
  final codeControllers = List.generate(5, (index) => TextEditingController());
  var isButtonEnabled = false.obs; // Observable for button enabled state

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    verification = Verification(Get.find());

    // Add listeners to code controllers
    for (var controller in codeControllers) {
      controller.addListener(_checkIfButtonShouldBeEnabled);
    }
  }

  @override
  void onClose() {
    // Dispose controllers
    for (var controller in codeControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  // Method to check if the button should be enabled
  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled.value = codeControllers.every((controller) => controller.text.isNotEmpty);
  }

  // Method to verify the code
  verifyCode() async {
    statusRequest = StatusRequest.loading;
    update();

    String code = codeControllers.map((controller) => controller.text).join();

    try {
      var response = await verification.Verifica(email!, code);
      print('Response: $response'); // Debugging: Log the response
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "Success" ) {
          Get.toNamed(AppRoutes.ResetPassword,arguments:{ "email": email});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Invalid verification code");
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print('Error: $e'); // Debugging: Log the error
      Get.defaultDialog(title: "Error", middleText: "An unexpected error occurred");
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
