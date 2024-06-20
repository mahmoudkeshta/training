import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:training/presentation/home_page/controller/home_controller.dart';

import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';

void main() {
  runApp(MaterialApp(
    home: CourseDetailScreen(),
  ));
}

class CourseDetailScreen extends StatelessWidget {

 final showcoursecontrollerImg controller = Get.put(showcoursecontrollerImg());
  var arguments = Get.arguments;
  // String   course = Get.arguments['Course'] ; 

 //final Course = Get.Course;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
          
            "${controller.Course.title}",
           // "l",
          
           style: TextStyle(color: Colors.black),
          ),
          
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
                Text(  "${controller.Course.evaluation}",style: TextStyle(color: Colors.black87),),
                SizedBox(width: 16),
                Text('10.5k Learners',style: TextStyle(color: Colors.black87),),
                ],
            ),
            
            TabBar(
              tabs: [
                Tab(text: 'Overview', ),
                Tab(text: 'Lectures'),
                Tab(text: 'Similar Courses'),
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
    return SingleChildScrollView(
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
                onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Lesson 1'),
              subtitle: Text('Introduction'),
              children: <Widget>[
                ListTile(title: Text('Sub lecture 1')),
              ],
            ),
            ExpansionTile(
              title: Text('Lesson 2'),
              subtitle: Text('Data Preprocessing'),
              children: <Widget>[
                ListTile(title: Text('Sub lecture 1')),
                ListTile(title: Text('Sub lecture 2')),
                ListTile(title: Text('Sub lecture 3')),
                ListTile(title: Text('Sub lecture 4')),
              ],
            ),
            ExpansionTile(
              title: Text('Lesson 3'),
              subtitle: Text('Text Mining'),
              children: <Widget>[
                ListTile(title: Text('Sub lecture 1')),
              ],
            ),
            ExpansionTile(
              title: Text('Lesson 4'),
              subtitle: Text('Practice Projects'),
              children: <Widget>[
                ListTile(title: Text('Sub lecture 1')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimilarCoursesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Similar Courses'),
    );
  }
}
