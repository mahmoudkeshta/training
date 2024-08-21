
import 'dart:async';

import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';

abstract class HomeController extends GetxController {
  HomeController(this.homeModelObj,this.Course,this.Coursedetails,this.Department,this.Popular_bloggers,this.Coursemedia);
//final m= "".obs;
 RxBool isAnimationEnabled = true.obs;
 List advertisements = [];

     List popular_bloggers1 = [];
     List coursedetails1 = [];
  List course1 = [];
  List data = [];
   List department1 = [];
   List coursemedia1 = [];
   List usercourseregistration1 = [];
   
  var isLoading = true.obs;
  Rx<HomeModel> homeModelObj;
  Myservices myservices = Get.find();
  Homedata homedata = Homedata(Get.find());
  String? username;
  String? id;
    course Course;
    popular_bloggers Popular_bloggers;
    coursedetails Coursedetails;
    department Department;
    coursemedia Coursemedia;
  gotoshowcourse( course Course, coursedetails  Coursedetails,//department Department,
  coursemedia Coursemedia);
    gotoshowcourse1(  coursedetails  Coursedetails);
  gotopopularbloggers(popular_bloggers Popular_bloggers);
  gotolistDepartment(course Course, department Department);
 late StatusRequest statusRequest;

am(double w);

  Rx<int> sliderIndex = 0.obs;
  initialData();
 void startAnimationTimer() {
    Timer(Duration(seconds: 1), () {
      isAnimationEnabled.value = true;
    });
  }
  @override
  void onInit() {
    initialData();
    getdara();
     startAnimationTimer();

    super.onInit();
  }

  

    getdara() async {
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


class HomeControllerImp extends HomeController {

 
  HomeControllerImp(Rx<HomeModel> homeModelObj) : super(homeModelObj,course(),coursedetails(),department(),popular_bloggers(),coursemedia());
  @override
  initialData() {

    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
    
  }
  
  @override
  // ignore: non_constant_identifier_names
  gotoshowcourse(Course,Coursedetails//,Department
  ,Coursemedia) {
 Get.toNamed(AppRoutes.show_course,arguments: {
  "Course":Course,
  "Coursedetails":Coursedetails,
  //"Department":Department,
  "Coursemedia":Coursemedia,

 });

  }
  
  @override
  gotopopularbloggers(Popular_bloggers) {
    Get.toNamed(AppRoutes.bloggerCard,arguments: {

      "Popular_bloggers":Popular_bloggers,
    });
  }
  
  @override
  gotoshowcourse1(coursedetails Coursedetails) {
Get.toNamed(AppRoutes.show_course,arguments: {
  
  "Coursedetails":Coursedetails,
  //"Department":Department,


 });
  }
  
  @override
  gotolistDepartment(course Course, department Department) {
   Get.toNamed(AppRoutes.ListDepartment,arguments: {
  "Course":Course,

  "Department":Department,


 });
  }
  
  @override
  am(  w) {
  
  return w;
  }
}
