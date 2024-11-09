import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';

class Viewhierarchy1ItemWidget1 extends StatefulWidget {
  //final course Course;
  final coursedetails Coursedetails;
  final coursemedia Coursemedia;
  final coursedetails2 Coursedetails2;

  const Viewhierarchy1ItemWidget1({
    super.key,
  //  required this.Course,
    required this.Coursedetails,
    required this.Coursemedia,
    required this.Coursedetails2,
  });

  @override
  _Viewhierarchy1ItemWidgetState createState() => _Viewhierarchy1ItemWidgetState();
}

class _Viewhierarchy1ItemWidgetState extends State<Viewhierarchy1ItemWidget1> {
  final HomeController controller = Get.find<HomeController>();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isExpanded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.gotoshowcourse2(//widget.Course,
         widget.Coursedetails, widget.Coursemedia, widget.Coursedetails2);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isExpanded ? 210.h : 150.h, // Adjust width for horizontal layout
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          child: Row( // Use Row for horizontal layout
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
                child: 
                CachedNetworkImage(
        imageUrl: "${  widget.Coursedetails.Image_courese}",
        height: 168.v,
                  width: 100.h,
                   fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
              ),
              Expanded( // Use Expanded to fill remaining space
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display title horizontally
                      Row(
                        children: [
                          Expanded( // Expand to take available width
                            child: Text(
                              widget.Coursedetails.courseTitle!,
                              style: CustomTextStyles.bodyLargeGray80002,
                              overflow: TextOverflow.ellipsis, // Prevent overflow with ellipsis
                              maxLines: 1, // Limit to one line
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.v),
                      Row(
                        children: [
                          Text(
                            widget.Coursedetails.evaluation!,
                            style: CustomTextStyles.bodySmallGray80002,
                          ),
                          SizedBox(width: 4.h),
                          // Uncomment this line if you want to show the star icon
                                 Icon(Icons.star_half, size: 10, color: Colors.amber),
                         // SizedBox(width: 16.h),
                    
                        
                        ],
                      ),

                      
                         Text(
                                                   widget.Coursedetails.courseDescription!,
                                                            overflow: TextOverflow.clip, // Prevent overflow with ellipsis
                                
                            style: CustomTextStyles.bodySmallGray80002,
                          ),


                    ],
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
