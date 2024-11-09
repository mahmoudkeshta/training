import 'dart:ui';

import 'package:get/get.dart';
import 'package:training/core/network/services.dart';

class localizationcontroller extends GetxController{
  Locale ? Language;
  Myservices myservices =Get.find();
 changelang(String langcode){
  Locale locale =Locale(langcode);
  myservices.sharedPreferences.setString("lang", langcode);
  Get.updateLocale(locale);
 }
 @override
  void onInit() {
    String ? sharedpreferen=  myservices.sharedPreferences.getString("lang");
        myservices.sharedPreferences.setString("step", "1");

    if(sharedpreferen=="ar"){
      Language = const Locale("ar");
    }else if(sharedpreferen=="en"){
      Language = const Locale("en");

    }else{
      Language =  Locale(Get.deviceLocale!.languageCode);

    }
    super.onInit();
  }

}