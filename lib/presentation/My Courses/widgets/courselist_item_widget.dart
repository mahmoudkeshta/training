import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/My%20Courses/controller/mycourselistc.dart';
import 'package:training/presentation/My%20Courses/models/data.dart';
import 'package:training/presentation/admin/modle/Course.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import '../../../core/app_export.dart';
import '../../home_page/models/coursedetails.dart';

class CourselistItemWidget extends StatefulWidget {
  const CourselistItemWidget({super.key});

  
 
  @override
  _CourselistItemWidgetState createState() => _CourselistItemWidgetState();
}


    final HomeController homeController = Get.find();


class _CourselistItemWidgetState extends State<CourselistItemWidget> {
  final mycourselistc controller = Get.find();
late Data data;
 late coursedetails Coursedetails;
    late coursedetails2 Coursedetails2;
    late coursemedia Coursemedia;
late final int ?i;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<mycourselistc>(
      builder: (controller) {
        return HandlingDataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return 
          
                _buildCourseCard( index , controller);
              },
            ),
          ),
        );
      },
    );
  }

  // Card design
  Widget _buildCourseCard(int index, mycourselistc controller) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardHeader(index, controller),
            _buildCourseDetails(index, controller),
            _buildStartLearningButton(),
          ],
        ),
      ),
    );
  }

  // Image and course title in header
  Widget _buildCardHeader(int index, mycourselistc controller) {
    return Stack(
      children: [
        // Placeholder for course image (replace with actual image)
       Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(controller.data[index].Image_courese.toString()), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ), 
        // Gradient overlay to enhance text readability
        Container(
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        // Course title over the image
        Positioned(
          bottom: 10,
          left: 15,
          child: Text(
            "${controller.data[index].courseTitle}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Course description
  Widget _buildCourseDetails(int index, mycourselistc controller) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.data[index].courseDescription}",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Button to start learning
  Widget _buildStartLearningButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(212, 157, 47, 1), // Change button color here
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {

        },
        child: const Center(
          child: Text(
            "Start Learning",
            style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.normal),
            
          ),
        ),
      ),
    );
  }
}
