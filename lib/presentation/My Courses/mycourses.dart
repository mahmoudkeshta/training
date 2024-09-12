import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/iphone_11_pro_max_ten_controller.dart';
import 'models/courselist_item_model.dart';
import 'models/iphone_11_pro_max_ten_model.dart';
import 'widgets/courselist_item_widget.dart'; // ignore_for_file: must_be_immutable

class mycourses extends StatelessWidget {
  mycourses({Key? key}) : super(key: key);

  final Iphone11ProMaxTenController controller =
      Get.put(Iphone11ProMaxTenController(Iphone11ProMaxTenModel().obs));
  final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));
 late StatusRequest statusRequest;
Myservices myservices=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(height: 10.v),
                _buildCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarSubtitle(
        text: "lbl_my_courses".tr,
        margin: EdgeInsets.only(left: 26.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchGray80002,
          margin: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 5.v,
          ),
        )
      ],
    );
  }

 Widget _buildCourseList() {

String? id = myservices.sharedPreferences.getString("id");
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.h),
    child: GetBuilder<HomeController>(
      builder: (controller1) {
        // Check if the list is null or empty before building the ListView
        if (      controller1.course1 != null && controller1.course1.isNotEmpty) {
                   return HandlingDataview(statusRequest: controller1.statusRequest, widget: 
          
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.5.v),
                child: SizedBox(
                  width: 364.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.whiteA700,
                  ),
                ),
              );
            },
            itemCount: controller1.course1.length, // Ensure the itemCount matches the list length
            itemBuilder: (context, index) {
              if (index < controller1.usercourseregistration1.length) {
                return CourselistItemWidget(
                    Course: course.fromJson(controller1.course1[index]),
                    Coursedetails:coursedetails.fromJson(controller1.coursedetails1[index]), 
                   // Department:department.fromJson(controller.department1[index]), 
                    Coursemedia: coursemedia.fromJson(controller1.coursemedia1[index]),
                     Usercourseregistration: usercourseregistration.fromJson(controller1.usercourseregistration1[index]), Coursedetails2: coursedetails2.fromJson(controller1.coursed[index]), 
                );
              } else {
                return SizedBox.shrink(); // Return an empty widget if index is out of bounds
              }
            },
                    ) );
        } else {
          // Show a message or an empty state when the list is null or empty
          return Center(
            child: Text('No courses available or access denied'),
          );
        }
      },
    ),
  );
}
}