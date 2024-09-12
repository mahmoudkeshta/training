import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/signup/models/signup.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/routes/app_routes.dart';


abstract class LoginPageController extends GetxController {
  Future<void> signUp();
  Future<void> goToSignUp();
}

class LogController extends LoginPageController {
  late StatusRequest statusRequest;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late signup signup1;
  bool isButtonEnabled = false;

  List data = [];

  @override
  void onInit() {
    super.onInit();
    signup1 = signup(Get.find());

    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();

    usernameController.addListener(_checkIfButtonShouldBeEnabled);
    emailController.addListener(_checkIfButtonShouldBeEnabled);
    passwordController.addListener(_checkIfButtonShouldBeEnabled);
    phoneController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  @override
  Future<void> goToSignUp() async {
  //  statusRequest = StatusRequest.loading;
   // update();

    var response = await signup1.postDate(
      usernameController.text,
      passwordController.text,
      emailController.text,
      phoneController.text,
    );
   
    statusRequest = handlingData(response);
 Get.toNamed(AppRoutes.VerifyCodesinup, arguments:await {
          "email":  emailController.text,
        });
        
    if (statusRequest == StatusRequest.success) {
       
      if (response['status'] == "Success") {
       
      Get.toNamed(AppRoutes.VerifyCodesinup );
        
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
  

  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled = usernameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty;
    update();
  }
}
