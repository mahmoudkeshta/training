import 'package:flutter/material.dart';
import 'package:training/presentation/home_page/models/advertisements.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../controller/home_controller.dart';
import '../models/onlineworld_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OnlineworldItemWidget extends StatelessWidget {
  advertisements depar;
  OnlineworldItemWidget(this.onlineworldItemModelObj, {Key? key,required this.depar})
      : super(
          key: key,
        );

  OnlineworldItemModel onlineworldItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 30.v,
        ),
        decoration: AppDecoration.gradientOnPrimaryToDeepPurpleA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 2.v,//7
                bottom: 31.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
              /**
               *    controller.departmentList.isNotEmpty 
                          ? controller.departmentList[0].name ?? "Department Name"
                          : "Loading...",
               */
              "${depar.title}",
                   // "msg_secure_the_online".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 1.v),
                  SizedBox(
                    width: 193.h,
                  
                    child: 
                    Text(
                        "${depar.description}",
                    //  "msg_lets_get_you_started".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 14.v),
                  CustomElevatedButton(
                    width: 129.h,
                    text: "lbl_enroll_for_free".tr,
                  )
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgGroup,
              height: 130.v,
              width: 129.h,
              margin: EdgeInsets.only(
                right: 4.h,
                bottom: 13.v,
              ),
            )
          ],
        ),
      ),
    );
  }
}
