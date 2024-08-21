import 'package:flutter/material.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/showcourse/models/showc.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class showcoursecontroller extends GetxController{
  
  //Future<void> goaddshow();



}


class showcoursecontrollerImg extends showcoursecontroller{
 late StatusRequest statusRequest;
 late course  Course ;
 late coursedetails Coursedetails ;
 //late department Department;
  late usercourseregistration Usercourseregistration;
  late TextEditingController phoneController;

  
  



intialData(){
 Course =Get.arguments['Course'];
    

 //Department =Get.arguments['Department'];
 Coursedetails =Get.arguments['Coursedetails'];
  

}

@override
  void onInit() {
   // Course.courseID=TextEditingController() as int?;
intialData();

    super.onInit();
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  /**
   * 
  @override
  Future<void> goaddshow() async{
  
    var response = await showc.postDate(
      

    );
   
    statusRequest = handlingData(response);
 
        
    if (statusRequest == StatusRequest.success) {
        Get.toNamed(AppRoutes.VerifyCodesinup );
      if (response['status'] == "Success") {
       
     
        
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Phone number already exists");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

   */

}