import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:training/core/app_export.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/listDepartment/listDepartment_controller.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

void main() {
  runApp(listDepartment());
}



class listDepartment extends StatelessWidget {
 final listDepartment_controllerImg controller = Get.put(listDepartment_controllerImg());

  var arguments = Get.arguments;
late course  Course ;
late department Department;

  

  @override
  Widget build(BuildContext context) {
    coursedetails  Coursedetails ;
 late StatusRequest statusRequest;

 final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));

    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.Department.name}'),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller1) {
          
          return HandlingDataview(statusRequest: controller1.statusRequest, widget: 
          ListView.builder(
            itemCount: controller1.coursedetails1.length,
            itemBuilder: (context, index) {
               final courseDetail = coursedetails.fromJson(controller1.coursedetails1[index]);
                                          if (index >= controller1.course1.length ||
    index >= controller1.coursedetails1.length ||
    index >= controller1.department1.length ||
    index >= controller1.coursemedia1.length // Make sure to add this check as well
) {
  return SizedBox(); // Return an empty box or handle the error gracefully
}
             
              return 
              
              controller.Department.name==courseDetail.departmentName ?
              CourseCard(Coursedetails: courseDetail, Coursemedia: coursemedia.fromJson(controller1.coursemedia1[index]), Course: course.fromJson(controller1.course1[index]),):    Container( 
               
            );
          
            },
          )
          );
        }
      ),
    );
  }
}



class CourseCard extends StatelessWidget {
  final coursedetails  Coursedetails ;
 course  Course ;
    coursemedia Coursemedia;

  CourseCard({required this.Coursedetails,required this.Coursemedia,required this.Course});
 final listDepartment_controllerImg controller = Get.put(listDepartment_controllerImg());
 final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));
    
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:  Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     '${Coursedetails.courseTitle}',
                     // course.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                         '${Coursedetails.evaluation}',
                         // '${course.rating}'
                          ),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(//'${course.learners} Learners'
                    '',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  //course.imageUrl,
         '${controller.Course.imageCourese}',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        
        controller1.gotoshowcourse(Course,Coursedetails,Coursemedia);
      },
    );
  }
}
