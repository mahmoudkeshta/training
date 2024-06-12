import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:training/Verification/models/Verification.dart';
import 'package:training/Verifiy/models/Verification.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

// Define the StatusRequest enum with an 'initial' constant
enum StatusRequest {
  initial, // Define the initial state
  loading,
  success,
  failure,
}

class VerificationController1 extends GetxController {
  String? email;
  late Verification1 verification;
  var statusRequest = StatusRequest.initial.obs; // Set initial state here
  final codeControllers = List.generate(5, (index) => TextEditingController());

  @override
  void onInit() {
    initialized;
    super.onInit();

    email = Get.arguments['email'];
    verification = Verification1(Get.find());
    for (var controller in codeControllers) {
      controller.addListener(_checkIfButtonShouldBeEnabled);
    }
  }

  @override
  void onClose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  bool get isButtonEnabled {
    return codeControllers.every((controller) => controller.text.isNotEmpty);
  }

  void _checkIfButtonShouldBeEnabled() {
    update(); // This will call the getter `isButtonEnabled` and update the UI accordingly
  }

  verifyCode() async {
    statusRequest(StatusRequest.loading);
    update();

    String code = codeControllers.map((controller) => controller.text).join();
    if (email == null) {
      print('Error: Email is null'); // Debugging: Log the error
      Get.defaultDialog(title: "Error", middleText: "Email is null");
      statusRequest(StatusRequest.failure);
      update();
      return;
    }

    try {
      var response = await verification.Verifica1(email!, code);
      // print('Response: $response'); // Debugging: Log the response

      statusRequest(handlingData(response));

      if (StatusRequest.success == statusRequest.value) {
        if (response['status'] == "Success") {
          Get.toNamed(
            AppRoutes.ResetPassword,
            arguments: {
              'email': email,
            },
          );
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Invalid verification code");
          statusRequest(StatusRequest.failure);
        }
      } else {
        statusRequest(StatusRequest.failure);
      }
    } catch (e) {
      print('Error: $e'); // Debugging: Log the error
      Get.defaultDialog(title: "Error", middleText: "An unexpected error occurred");
      statusRequest(StatusRequest.failure);
    }

    update();
  }
}
