import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';

import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/VideoPlayerScreen.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';

void main() {
  runApp(MaterialApp(
    home: CourseDetailScreen(),
  ));
}

class CourseDetailScreen extends StatelessWidget {

 final showcoursecontrollerImg controller = Get.put(showcoursecontrollerImg());
  var arguments = Get.arguments;
    late coursedetails2 Coursedetails2;

  // String   course = Get.arguments['Course'] ; 

 //final Course = Get.Course;
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
         Row(children: [

            Text(
            //"${controller.Coursedetails2.favorite}",
          
           "${controller.Course.title}",
           // "l",
            overflow: TextOverflow.ellipsis,
           style: TextStyle(color: Colors.black),
          ),
          Spacer(),
        
       IconButton(onPressed: (){}, icon: Icon(
        controller.Coursedetails2.favorite ==1 ?
      Icons.favorite :Icons.favorite_border_outlined
       ),
       color: Colors.red,)
         ],)
          
          
        ),
        body: Column(
          children: [
            Image.network("${controller.Course.imageCourese}"), // Replace with your image asset
             
              Text(
                
             "${controller.Course.title}",
                style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text(  "${controller.Course.evaluation}"
                ,style: TextStyle(color: Colors.black87),),
                SizedBox(width: 16),
                Text('10.5k Learners',style: TextStyle(color: Colors.black87),),
                ],
            ),
            
            TabBar(
              tabs: [
                Tab(text: 'Overview', ),
                Tab(text: 'Lectures'),
                Tab(text: 'Dates Courses'),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OverviewTab(),
                  LecturesTab(),
                  SimilarCoursesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
 final showcoursecontrollerImg controller = Get.put(showcoursecontrollerImg());


  @override
  Widget build(BuildContext context) {

    return 
    
    
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            //SizedBox(height: 16),
            Text(
              'What will I learn?',
           
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
           "${controller.Course.description}",
                   style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 16),
            Text(
              'Ratings and Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black87),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("${controller.Course.evaluation}",style: TextStyle(color: Colors.black87),),
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star_half, color: Colors.orange),
                Icon(Icons.star_border),
                SizedBox(width: 8),
                Text('3 reviews',style: TextStyle(color: Colors.black87),),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
  var arguments = Get.arguments;

    final String zoomUrl = "${controller.Coursedetails.courseURL}";

                 controller.launchURL(zoomUrl);
                },
                child: Text('Start Learning',style: TextStyle(color: Colors.black87),),
              ),
            ),
          ],
        ),
      ),
    );

  }
}




class LecturesTab extends StatelessWidget {
   final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));
// Assuming HomeController extends GetxController


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      
      init: controller1,
      builder: (controller) {
        
        return HandlingDataview(
          statusRequest: controller.statusRequest, // Assuming statusRequest is a property in HomeController
          widget: ListView.builder(
            
            padding: const EdgeInsets.all(16.0),
               itemCount: controller.coursemedia1.length,
            itemBuilder: (BuildContext context, int index) { return
         
            Show(Coursemedia: coursemedia.fromJson(controller.coursemedia1[index]),
              Course: course.fromJson(controller.course1[index]),);
             },
           
          ),
        );
      },
    );
  }
}

class Show extends StatelessWidget {
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
coursemedia Coursemedia;
 course Course;
 
final showcoursecontrollerImg controller1 = Get.put(showcoursecontrollerImg());
  var arguments = Get.arguments;


   Show({
    super.key,
    required this.Coursemedia
    ,required this.Course
  });

  @override
  Widget build(BuildContext context) {
 
    return 
      Coursemedia.courseID==controller1.Course.courseID ?
    ExpansionTile(
    title: Text(
       "${Coursemedia.mediaType}",
    )
    ,
    subtitle: Text("${Coursemedia.description}"),
    children: <Widget>[
    //  ListTile(title: Text("${Coursemedia.mediaURL}")),
    ListTile(title: 
    InkWell(child: Text('Sub lecture 2')),onTap: () {
      Coursemedia.mediaURL != ""?
      Get.to(VideoPlayerScreen(videoUrl: '${Coursemedia.mediaURL}',) ):  Get.snackbar(
        'Error',
        'No content available',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    },),
   //   ListTile(title: Text('Sub lecture 3')),
   //   ListTile(title: Text('Sub lecture 4')),
    ],
              ):Container();
  }
}

class SimilarCoursesTab extends StatelessWidget {
  final showcoursecontrollerImg controller = Get.put(showcoursecontrollerImg());
 final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));
  var arguments = Get.arguments;
 

  @override
  Widget build(BuildContext context) {
    return 
    
    HandlingDataview(statusRequest: controller1.statusRequest, widget: 
    Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
            Text(
              'Dates Courses',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Table(
              border: TableBorder.all(
                color: Colors.grey,
                width: 1.0,
              ),
              children: [
              
                _buildTableRow('Description', '${controller.Coursedetails.departmentName}', Colors.green),
/***
 *                 _buildTableRow('Start Date', '2024-06-01', Colors.orange),
                _buildTableRow('End Date', '2024-06-15', Colors.yellow),
 */
              //  _buildTableRow('Evaluation', '4.1', Colors.red),
                _buildTableRow('Admin Name', "${controller.Coursedetails.adminName}", Colors.purple),
              //  _buildTableRow('Course Title', 'Course 2', Colors.blue),
                _buildTableRow('Session Date', '${controller.Coursedetails.sessionDate}', Colors.green),
                _buildTableRow('Start Date', '${controller.Coursedetails.startDate}', const Color.fromARGB(255, 255, 152, 0)),
                _buildTableRow('End Date', '${controller.Coursedetails.endDate}', Colors.yellow),
                _buildTableRow('Day Of Week', '${controller.Coursedetails.dayOfWeek}', Colors.purple),
              //  _buildTableRow('course URL', '${controller.Coursedetails.courseURL}', Colors.purple),
              ],
            ),
          ],
        ),
      ),
     ) 
       );
  }

  TableRow _buildTableRow(String label, String value, Color color) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            color: color.withOpacity(0.1),  // إضافة شفافية للألوان
            padding: EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            color: color.withOpacity(0.1),  // إضافة شفافية للألوان
            padding: EdgeInsets.all(8.0),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
