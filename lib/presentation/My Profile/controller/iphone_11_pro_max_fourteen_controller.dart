import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

/// A controller class for the Iphone11ProMaxFourteenPage.
/// 
/// This class manages the state of the Iphone11ProMaxFourteenPage, including the
/// current iphone11ProMaxFourteenModelObj
class MyCourses extends GetxController {


 

  String username = "";
  String email = "";
  late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString("username") ?? "";
    email = sharedPreferences.getString("email") ?? "";
    update(); // This will notify GetX that the controller's state has been updated
  }
}
