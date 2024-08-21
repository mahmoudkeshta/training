import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';
import '../models/iphone_11_pro_max_fourteen_model.dart';

/// A controller class for the Iphone11ProMaxFourteenPage.
/// 
/// This class manages the state of the Iphone11ProMaxFourteenPage, including the
/// current iphone11ProMaxFourteenModelObj
class Iphone11ProMaxFourteenController extends GetxController {
  Iphone11ProMaxFourteenController(this.iphone11ProMaxFourteenModelObj);

  Rx<Iphone11ProMaxFourteenModel> iphone11ProMaxFourteenModelObj;

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
