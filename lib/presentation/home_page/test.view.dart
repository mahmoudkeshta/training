import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingDataview.dart';
import 'package:training/presentation/home_page/controller/test_controller.dart';

class TestView extends StatelessWidget {
  
      final TestController controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    // Ensuring that the controller is put only once

    return  Scaffold(

        appBar: AppBar(title: Text("Test View")),
        body: GetBuilder<TestController>(builder: (controller) {

    return HandlingDataview( statusRequest :controller.statusRequest,widget: ListView.builder(
              itemCount: controller.department.length,
              itemBuilder: (context, index) {
                return   Text(
            "${controller.department[index]['Name']}",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.blue, // تغيير لون النص هنا
              fontSize: 24, // يمكنك تغيير حجم الخط إذا أردت
            ));//}
               
              },
            ),  
          
          
          
          );
       
        }),
      );
   
  }
}
