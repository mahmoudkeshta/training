import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import '../../../core/app_export.dart';
import '../controller/iphone_11_pro_max_ten_controller.dart';

class CourselistItemWidget extends StatefulWidget {
  final course Course;
  final coursedetails Coursedetails;
  final coursemedia Coursemedia;
  final usercourseregistration Usercourseregistration;
 final coursedetails2 Coursedetails2;

  
int ?selectcart;

  CourselistItemWidget({
    Key? key,
    required this.Course,
    required this.Coursedetails,
    required this.Coursedetails2,
    required this.Coursemedia, required this.Usercourseregistration,
  }) : super(key: key);

  @override
  _CourselistItemWidgetState createState() => _CourselistItemWidgetState();
}

class _CourselistItemWidgetState extends State<CourselistItemWidget> {
  var controller = Get.find<Iphone11ProMaxTenController>();
  final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));

  bool _isExpanded = false;

/**
 *   @override
  void initState() {
    super.initState();
    // تغيير حالة _isExpanded بعد فترة زمنية
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
         _isExpanded = !_isExpanded;
             print("Expanded state: $_isExpanded"); 
      }
      );
    });
  }
 */

  @override
  Widget build(BuildContext context) {
Myservices myservices=Get.find();
String? id = myservices.sharedPreferences.getString("id");
String? username = myservices.sharedPreferences.getString("username");
String? email = myservices.sharedPreferences.getString("email");

    return 
widget.Coursedetails.idusers.toString() == id 
//widget.Usercourseregistration.userID.toString() == id 
    //widget.Usercourseregistration.courseID.toString() == //courseID
//&& 
//widget.Usercourseregistration.courseID.toString() == widget.Course.courseID.toString()

// '${id}'=="${controller1.Usercourseregistration.userID}"
   // == 
    ?  
    
    AnimatedContainer(
      
      duration: Duration(seconds: 1), // مدة الحركة
      curve: Curves.easeInOut, // منحنى الحركة
      width: _isExpanded ? 400 : 50, // عرض الحاوية يتغير مع الحركة
      decoration: AppDecoration.outlineBlack900,
      child: Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.Coursedetails.courseTitle}",
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 7.v),
                      SizedBox(
                        width: 206.h,
                        child: Text(
                          "${widget.Coursedetails.courseDescription}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgBytesizeClock,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            margin: EdgeInsets.only(top: 1.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "l",
                              style: theme.textTheme.bodySmall,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 62.adaptSize,
                    width: 62.adaptSize,
                    margin: EdgeInsets.only(
                      top: 15.v,
                      bottom: 21.v,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "2 hours left",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 62.adaptSize,
                            width: 62.adaptSize,
                            decoration: BoxDecoration(
                              color: appTheme.greenA700,
                              borderRadius: BorderRadius.circular(31.h),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 36.v),
            InkWell(
              child: Text(
                "Start Learning",
                style: CustomTextStyles.bodyLargePrimaryContainer,
              ),
              onTap: () {
                controller1.gotoshowcourse(
                    widget.Course, widget.Coursedetails, widget.Coursemedia,widget.Coursedetails2//,widget.selectcart!
                    );
              },
              onDoubleTap: () {    setState(() {
         _isExpanded = !_isExpanded;
             print("Expanded state: $_isExpanded"); 
      }
      );
                
              },

            ),
          ],
        ),
      ),
    ):Container();
  }
}