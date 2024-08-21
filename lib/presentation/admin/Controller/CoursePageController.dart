
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/admin/modle/Course.dart';
import 'package:training/presentation/admin/modle/CourseMedia.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';

import 'package:training/presentation/signup/models/statusrequest.dart';


abstract class CoursePageController extends GetxController {
  Future<void> addCourse();
  getdara();

}

class CourseController extends CoursePageController {
  Homedata homedata = Homedata(Get.find());

   List advertisements = [];

     List popular_bloggers1 = [];
     List coursedetails1 = [];
  List course1 = [];
  List data = [];
   List department1 = [];
   List coursemedia1 = [];
   List usercourseregistration1 = [];


  bool isButtonEnabled = false;
   late Course course;
   late popular_bloggers Popular_bloggers;
  late  coursedetails Coursedetails;
   late department Department;
   late coursemedia Coursemedia;


  late StatusRequest statusRequest;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController locationIDController;
  late TextEditingController adminIDController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController imageCourseController;
  late TextEditingController evaluationController;



  @override
  void onInit() {
    super.onInit();
    course = Course(Get.find());
getdara();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    locationIDController = TextEditingController();
    adminIDController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    imageCourseController = TextEditingController();
    evaluationController = TextEditingController();

    titleController.addListener(_checkIfButtonShouldBeEnabled);
    descriptionController.addListener(_checkIfButtonShouldBeEnabled);
    locationIDController.addListener(_checkIfButtonShouldBeEnabled);
    adminIDController.addListener(_checkIfButtonShouldBeEnabled);
    startDateController.addListener(_checkIfButtonShouldBeEnabled);
    endDateController.addListener(_checkIfButtonShouldBeEnabled);
    imageCourseController.addListener(_checkIfButtonShouldBeEnabled);
    evaluationController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    locationIDController.dispose();
    adminIDController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    imageCourseController.dispose();
    evaluationController.dispose();
    super.onClose();
  }

  @override
  Future<void> addCourse() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await course.postCourseData(
      titleController.text,
      descriptionController.text,
      locationIDController.text,
      adminIDController.text,
      startDateController.text,
      endDateController.text,
      imageCourseController.text,
      evaluationController.text,
    );
   
    statusRequest = handlingData(response);
    
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      
      } else {
        Get.defaultDialog(title: "Warning", middleText: response['message']);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled = titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      locationIDController.text.isNotEmpty &&
                      adminIDController.text.isNotEmpty &&
                      startDateController.text.isNotEmpty &&
                      endDateController.text.isNotEmpty &&
                      imageCourseController.text.isNotEmpty &&
                      evaluationController.text.isNotEmpty;
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
