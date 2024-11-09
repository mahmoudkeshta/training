import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/favorite/favorite_data_view.dart';
import 'package:training/presentation/favorite/myfavoriteModel.dart';
import 'package:training/presentation/home_page/controller/test.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/routes/app_routes.dart';

class favoritecontrollerdata extends GetxController {

  List<MyFavoriteModel> data = [];
   late  StatusRequest statusRequest;
Myservices myservices =Get.find();
  Favoritedataview favoritedataview =Favoritedataview(Get.find());
   Homedata homedata = Homedata(Get.find());
   List course1 = [];

   List department1 = [];
   List coursemedia1 = [];
   List   popular_bloggers1=[];
   List coursedetails1=[];
   List advertisements =[];
   List usercourseregistration1=[];
   late course Course;
  late  popular_bloggers Popular_bloggers;
   late coursedetails Coursedetails;
   late coursedetails2 Coursedetails2;
   late department Department;
   late coursemedia Coursemedia;
    late usercourseregistration Usercourseregistration;
getData() async {
  //data.clear();
  statusRequest = StatusRequest.loading;
   // Update the UI to reflect loading state

    var response = await favoritedataview.getfavorite(myservices.sharedPreferences.getString("id")!);
   
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
    if(response['status']=="success"){
       //data.addAll(response['data']);
     List responsedata =response['data'];
     data.addAll(responsedata.map((e)=>MyFavoriteModel.fromJson(e)));
      print("data-------");
      print(data);
    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

   // Update the UI to reflect new data or error state
  }


 get() async {
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
 gotoshowcourse2(coursedetails Coursedetails, coursemedia Coursemedia, coursedetails2 Coursedetails2) {
   Get.toNamed(AppRoutes.show_course2,arguments: {
 // "Course":Course,
  "Coursedetails":Coursedetails,
  //"Department":Department,
  "Coursemedia":Coursemedia,
 "Coursedetails2":Coursedetails2,
 //"selectcart":selectcart,

 });
  }

deletefromfavorite(String favoriteId)  {
 // data.clear();
 // statusRequest = StatusRequest.loading;
    var response =  favoritedataview.deleteData(favoriteId);
    statusRequest = handlingData(response);
     data.removeWhere((element) => element.favoriteId == favoriteId);
       update(); 
  }
  @override
  void onInit() {
    getData();
 get();
    super.onInit();
  
    
    // Find the registered TestData instance
   
    
  }



}
