import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
// تأكد من أن المسار صحيح
import 'package:training/presentation/admin/modle/CourseMedia.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

abstract class courseMediacontroller extends GetxController {
  Future<void> addMedia();
  getdara();
}

class courseMediaControllerImg extends courseMediacontroller {
  late StatusRequest statusRequest;
  late TextEditingController courseIDController;
  late TextEditingController mediaTypeController;
  late TextEditingController mediaURLController;
  late TextEditingController descriptionController;
  Homedata homedata = Homedata(Get.find());

   List advertisements = [];

     List popular_bloggers1 = [];
     List coursedetails1 = [];
  List course1 = [];
  List data = [];
   List department1 = [];
   List coursemedia1 = [];
   List usercourseregistration1 = [];
  late CourseMedia courseMedia;

  bool isButtonEnabled = false;
   late course Course;
   late popular_bloggers Popular_bloggers;
  late  coursedetails Coursedetails;
   late department Department;
   late coursemedia Coursemedia;


  @override
  void onInit() {
    super.onInit();
    courseMedia = CourseMedia(Get.find());

    courseIDController = TextEditingController();
    mediaTypeController = TextEditingController();
    mediaURLController = TextEditingController();
    descriptionController = TextEditingController();

    courseIDController.addListener(_checkIfButtonShouldBeEnabled);
    mediaTypeController.addListener(_checkIfButtonShouldBeEnabled);
    mediaURLController.addListener(_checkIfButtonShouldBeEnabled);
    descriptionController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    courseIDController.dispose();
    mediaTypeController.dispose();
    mediaURLController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  @override
  Future<void> addMedia() async {
    // تأكد من أن الحقول ليست فارغة قبل إرسال الطلب
    if (courseIDController.text.isEmpty ||
        mediaTypeController.text.isEmpty ||
        mediaURLController.text.isEmpty) {
      Get.defaultDialog(title: "Warning", middleText: "Please fill all fields");
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await courseMedia.postCourseMediaData(
      courseIDController.text,
      mediaTypeController.text,
      mediaURLController.text,
      descriptionController.text
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.defaultDialog(title: "Success", middleText: response['message'] ?? 'Media added successfully');
      } else {
        Get.defaultDialog(title: "Warning", middleText: response['message'] ?? 'Unexpected error');
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled = courseIDController.text.isNotEmpty &&
                      mediaTypeController.text.isNotEmpty &&
                      mediaURLController.text.isNotEmpty;
    update();
  }
  
  @override
  getdara()async {
   statusRequest =  StatusRequest.loading;
   // Update the UI to reflect loading state

    var response = await homedata.getDate();
   
    statusRequest = handlingData(response);

    if ( StatusRequest.success == statusRequest ) {
    if(response['status']=="success"){
      department1.addAll(response['department']);
    
    course1.addAll(response['course']);
    advertisements.addAll(response['advertisements']);
    coursedetails1.addAll(response['coursedetails']);
    popular_bloggers1.addAll(response['popular_bloggers']);
    coursemedia1.addAll(response['coursemedia']);
    usercourseregistration1.addAll(response['usercourseregistration']);

    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }
  }
}



   
