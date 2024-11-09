import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/dee.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/login/models/login.dart';
import 'package:training/presentation/signup/models/crud.dart';
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
      if (response['status'] == "success" && response['data']['role_id'].toString()=="1") {
         
        myservices.sharedPreferences.setString("id", response['data']['id'].toString());
      
        myservices.sharedPreferences.setString("username", response['data']['users_name']);
            
        myservices.sharedPreferences.setString("email", response['data']['users_email']);
        myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
        myservices.sharedPreferences.setString("step", "2");
      //  onLogin();
       Get.offAllNamed(AppRoutes.homeContainerScreen);


    // myservices.sharedPreferences.setString(key, value)
      }else if(response['status'] == "success" && response['data']['role_id'].toString()=="2"){
           myservices.sharedPreferences.setString("id", response['data']['id'].toString());
      
        myservices.sharedPreferences.setString("username", response['data']['users_name']);
            
        myservices.sharedPreferences.setString("email", response['data']['users_email']);
        myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
        myservices.sharedPreferences.setString("admin", "2");
       Get.offAllNamed(AppRoutes.admin);
          
      }
      else if(response['status'] == "success" && response['data']['role_id'].toString()=="3"){
           myservices.sharedPreferences.setString("id", response['data']['id'].toString());
      
        myservices.sharedPreferences.setString("username", response['data']['users_name']);
            
        myservices.sharedPreferences.setString("email", response['data']['users_email']);
        myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
        myservices.sharedPreferences.setString("admin", "3");
       Get.offAllNamed(AppRoutes.admin);
          
      }
      
      
       else {
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
  Future<String> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.model; // على سبيل المثال للحصول على نوع الجوال
}
Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  
}
void onLogin() async {
  Crud crud = Crud(); // تهيئة كائن Crud
  LoginService loginService = LoginService(crud);

  String deviceType = await getDeviceInfo(); // الحصول على نوع الجوال
  Position location = await getCurrentLocation(); // الحصول على الموقع
  String locationString = "${location.latitude}, ${location.longitude}"; // تحويل الموقع لسلسلة نصية

  var result = await loginService.sendLoginData("123", deviceType, locationString); // إرسال البيانات

  if (result ) {
    print("Login data sent successfully.");
  } else {
    print("Failed to send login data.");
  }
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
