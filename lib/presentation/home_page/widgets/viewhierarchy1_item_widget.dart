 import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/viewhierarchy1_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Viewhierarchy1ItemWidget extends StatelessWidget {
 course Course;
  Viewhierarchy1ItemWidget(//this.viewhierarchy1ItemModelObj,
   {Key? key, required this.Course
  })
      : super(
          key: key,
        );
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
  //Viewhierarchy1ItemModel viewhierarchy1ItemModelObj;

  //var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 230.h,
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
                Container(
                  height: 133.v,
                  width: 230.h,
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL10,
                  ),
                  child: //Obx( () => 
                    CustomImageView(
                      imagePath:    "${Course.imageCourese}",
                      //ImageConstant.imageNotFound,
                         // viewhierarchy1ItemModelObj.dataScienceImag!.value,
                      height: 133.v,
                      width: 230.h,
                      radius: BorderRadius.vertical(
                        top: Radius.circular(10.h),
                      ),
                      alignment: Alignment.center,
                    ),
                 // ),
                ),
                SizedBox(height: 1.v),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: 
                  //Obx(
                    //() => 
                    Text(
                     "${Course.title}",
                         
                        /**
                         *   controller.course.isNotEmpty
                            ? Course.title ?? "Course"
                            : "Loading...",
                         */
          
            
                    //  viewhierarchy1ItemModelObj.dataScienceText!.value,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  ),
               // ),
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Row(
                    children: [
                    //  Obx(() => 
                        Text(
                        "${Course.evaluation}", 
                         
                        /**
                         *   controller.course.isNotEmpty
                            ? Course.evaluation ?? "No evaluation"
                            : "Loading...",
                         */
                        //  viewhierarchy1ItemModelObj.ratingText!.value,
                          style: CustomTextStyles.bodySmallGray80002,
                        ),
                    //  ),
                      CustomImageView(
                        imagePath: ImageConstant.imgStar,
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.only(left: 4.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: //Obx( () => 
                        Text(
                          "k",
                            //viewhierarchy1ItemModelObj.learnerText!.value,
                            style: CustomTextStyles.bodySmallGray80002,
                          ),
                        ),
                     // )
                    ],
                  ),
                ),
                SizedBox(height: 6.v)
              ],
            ),
          ),
        ),
      ),
      onTap: (){

        controller.gotoshowcourse(Course);
      },
    );
  }
}
