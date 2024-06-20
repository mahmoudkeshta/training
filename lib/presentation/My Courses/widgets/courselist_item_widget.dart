import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/iphone_11_pro_max_ten_controller.dart';
import '../models/courselist_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CourselistItemWidget extends StatelessWidget {
  CourselistItemWidget(this.courselistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  CourselistItemModel courselistItemModelObj;

  var controller = Get.find<Iphone11ProMaxTenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Obx(
                        () => Text(
                          courselistItemModelObj.machineLearning!.value,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 7.v),
                      SizedBox(
                        width: 206.h,
                        child: Obx(
                          () => Text(
                            courselistItemModelObj.machineLearning1!.value,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
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
                            child: Obx(
                              () => Text(
                                courselistItemModelObj.hoursLeftText!.value,
                                style: theme.textTheme.bodySmall,
                              ),
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
                          child: Obx(
                            () => Text(
                              courselistItemModelObj.percentageText!.value,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 62.adaptSize,
                            width: 62.adaptSize,
                            decoration: BoxDecoration(
                              color: appTheme.greenA700,
                              borderRadius: BorderRadius.circular(
                                31.h,
                              ),
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
            Obx(
              () => Text(
                courselistItemModelObj.startLearningTe!.value,
                style: CustomTextStyles.bodyLargePrimaryContainer,
              ),
            )
          ],
        ),
      ),
    );
  }
}
