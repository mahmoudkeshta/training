import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:training/Verification/models/Verification.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class VerificationController extends GetxController {
  String? email;
  late Verification verification;
  late StatusRequest statusRequest;
  final codeControllers = List.generate(5, (index) => TextEditingController());

  @override
  void onInit() {
    email = Get.arguments['email'];
      String code = codeControllers.map((controller) => controller.text).join();
    verification = Verification(Get.find());
    for (var controller in codeControllers) {
      controller.addListener(_checkIfButtonShouldBeEnabled);
    }
   
    super.onInit();
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
  
  codeControllers.every((controller) => controller.text.isNotEmpty); 
    update();
     // This will call the getter `isButtonEnabled` and update the UI accordingly
  }
verifyCode() async {
    statusRequest = StatusRequest.loading;
    

    String code = codeControllers.map((controller) => controller.text).join();
update();
    try {
      var response = await verification.Verifica(email!, code);
      print('Response: $response'); // Debugging: Log the response
       Get.toNamed(AppRoutes.homeContainerScreen);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
         
        if (response['status'] == "Success" ) {
        
       
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
