import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/linkapi.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/home_page.dart';
import 'package:training/presentation/login/models/login.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

abstract class LoginController extends GetxController {
  Future<void> signUp();
  Future<void> goToSignUp1();
  forgetpassword();

  
}

class LogController1 extends LoginController {
  SharedPreferences ? sharepref;

  late StatusRequest statusRequest;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  Myservices myservices=Get.find();
  late loginDate logindate;
  bool isButtonEnabled = false;

  List data = [];

  @override
  void onInit() {
    super.onInit();
    logindate = loginDate(Get.find());

    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(_checkIfButtonShouldBeEnabled);
    passwordController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
  //  emailController.dispose();
   // passwordController.dispose();
    super.onClose();
  }

  @override
  Future<void> goToSignUp1() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await logindate.loginData(
      emailController.text,
      passwordController.text
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
         
        myservices.sharedPreferences.setString("id", response['data']['id'].toString());
      
        myservices.sharedPreferences.setString("username", response['data']['users_name']);
            
        myservices.sharedPreferences.setString("email", response['data']['users_email']);
        myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
        myservices.sharedPreferences.setString("step", "2");
        
       Get.offAllNamed(AppRoutes.homeContainerScreen);


    // myservices.sharedPreferences.setString(key, value)
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
    // هنا يمكنك تنفيذ منطق التسجيل الخاص بك
  }

  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    update();
  }
  
  @override
  forgetpassword() {
  Get.toNamed(AppRoutes.CheckEmail);
  }
 
}
