import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class LoginService {
  Crud crud;

  // تهيئة Crud داخل المنشئ
  LoginService(this.crud);

  // دالة لإرسال بيانات تسجيل الدخول
  Future sendLoginData(String usersid, String deviceType, String location) async {
    var response = await crud.postData(AppLink.sendemail, {
      "usersid": usersid,
      "deviceType": deviceType,
      "location": location,
    });
    return response.fold((l) => l, (r) => r); // معالجة الاستجابة
  }
}
