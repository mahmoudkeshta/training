import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/services.dart';
void main (){
     runApp(ProfilePage());
}
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // هنا نستخدم MyServices للوصول إلى البيانات المخزنة مثل الاسم ورقم الهاتف
  final Myservices myservices = Get.find();

  // متغيرات لحفظ اسم المستخدم ورقم الهاتف
  String? username;
  String? phoneNumber;

  // متغير للتحكم في تحرير رقم الهاتف
  bool isEditingPhone = false;
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // استرداد البيانات من الـ SharedPreferences
    username = myservices.sharedPreferences.getString("username") ?? "No Name";
    phoneNumber = myservices.sharedPreferences.getString("phoneNumber") ?? "No Phone Number";
    phoneController.text = phoneNumber!; // وضع رقم الهاتف الحالي في الحقل
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              username!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // إذا كان المستخدم يقوم بتحرير رقم الهاتف، يتم عرض TextFormField
            isEditingPhone
                ? TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter new phone number',
                    ),
                  )
                : GestureDetector(
                    // إذا لم يكن في حالة تحرير، يمكن الضغط على الرقم لتعديله
                    onTap: () {
                      setState(() {
                        isEditingPhone = true;
                      });
                    },
                    child: Text(
                      phoneNumber!,
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),

            const SizedBox(height: 16),

            // زر الحفظ يظهر فقط عندما يكون في وضع تحرير
            isEditingPhone
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        phoneNumber = phoneController.text; // حفظ الرقم الجديد
                        myservices.sharedPreferences.setString("phoneNumber", phoneNumber!); // تخزين الرقم الجديد
                        isEditingPhone = false; // إغلاق وضع التحرير
                      });
                    },
                    child: const Text('Save'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
