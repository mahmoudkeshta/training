import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<Myservices> init() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
    } catch (e) {
      print('Error initializing SharedPreferences: $e');
    }
    return this;
  }

  String? getStep() {
    return sharedPreferences.getString('step');
  }
}

class AuthMiddleware extends GetMiddleware {
  final Myservices myservices = Get.find<Myservices>();

 @override
RouteSettings? redirect(String? route) {
  print('Middleware triggered');
  String? step = myservices.getStep();
  print('Step: $step');

  if (step != null && route != '/initialRoute') { // Add this check to avoid redundant navigation
    return RouteSettings(name: '/initialRoute');
  }
  return null;
}
}


Future<void> initialServices() async {
  await Get.putAsync(() => Myservices().init());
}