import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/iphone_11_pro_max_twelve_controller.dart';
import '../models/userprofilegrid_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofilegridItemWidget extends StatelessWidget {
  UserprofilegridItemWidget(this.userprofilegridItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofilegridItemModel userprofilegridItemModelObj;

  var controller = Get.find<Iphone11ProMaxTwelveController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: userprofilegridItemModelObj.dataScienceImag!.value,
              height: 118.v,
              width: 177.h,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Obx(
              () => Text(
                userprofilegridItemModelObj.dataScienceText!.value,
                style: CustomTextStyles.bodySmallGray80002,
              ),
            ),
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Obx(
              () => Text(
                userprofilegridItemModelObj.excelSkillsText!.value,
                style: CustomTextStyles.labelLargeGray80002,
              ),
            ),
          ),
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEye,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Obx(
                    () => Text(
                      userprofilegridItemModelObj.twentyKText!.value,
                      style: CustomTextStyles.bodySmallGray8000210,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 68.h),
                  child: Obx(
                    () => Text(
                      userprofilegridItemModelObj.dateText!.value,
                      style: CustomTextStyles.bodySmallGray8000210,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12.v)
        ],
      ),
    );
  }
}
