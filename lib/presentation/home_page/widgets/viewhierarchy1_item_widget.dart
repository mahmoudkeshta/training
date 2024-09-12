import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';

class Viewhierarchy1ItemWidget extends StatefulWidget {
  final course Course;
  final coursedetails Coursedetails;
  final coursemedia Coursemedia;
  final coursedetails2 Coursedetails2;
 //final int selectcart;
 
  const Viewhierarchy1ItemWidget({
    super.key,
    required this.Course,
    required this.Coursedetails,
    required this.Coursedetails2,
    required this.Coursemedia,
 //    required this.selectcart,

  });

  @override
  _Viewhierarchy1ItemWidgetState createState() => _Viewhierarchy1ItemWidgetState();
}

class _Viewhierarchy1ItemWidgetState extends State<Viewhierarchy1ItemWidget> {
  final HomeController controller = Get.find<HomeController>();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Start the animation automatically when the page loads
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoshowcourse(widget.Course, widget.Coursedetails, widget.Coursemedia,widget.Coursedetails2//,widget.selectcart
        );
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 4), // Duration of the animation
        curve: Curves.bounceOut, // Animation curve
        width: _isExpanded ? 230.h : 200.h, // Adjust width based on _isExpanded
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  height: 133.v,
                  width: 230.h,
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL10,
                  ),
                  child: CustomImageView(
                    imagePath: widget.Course.imageCourese,
                    height: 133.v,
                    width: 230.h,
                    radius: BorderRadius.vertical(
                      top: Radius.circular(10.h),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 0.5.v),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${widget.Course.title}",
                    style: CustomTextStyles.bodyLargeGray80002,
                  ),
                ),
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Row(
                    children: [
                      Text(
                        "${widget.Course.evaluation}",
                        style: CustomTextStyles.bodySmallGray80002,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgStar,
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.only(left: 4.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: Text(
                      //  "${widget.Coursedetails2.favorite}",
                         "10.5k Learners",
                          style: CustomTextStyles.bodySmallGray80002,
                        ),
                      ),
                      

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
