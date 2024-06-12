import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/iphone_11_pro_max_fourteen_controller.dart';
import 'models/iphone_11_pro_max_fourteen_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Iphone11ProMaxFourteenPage extends StatelessWidget {
  Iphone11ProMaxFourteenPage({Key? key})
      : super(
          key: key,
        );

  Iphone11ProMaxFourteenController controller = Get.put(
      Iphone11ProMaxFourteenController(Iphone11ProMaxFourteenModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 41.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 45.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                      vertical: 6.v,
                    ),
                    decoration: AppDecoration.fillBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22,
                    ),
                    child: Text(
                      "lbl_l".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 6.v,
                      bottom: 6.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_liza_horllow".tr,
                          style: CustomTextStyles.labelLargeGray80002,
                        ),
                        SizedBox(height: 2.v),
                        Text(
                          "msg_lizahorllow_gmail_com".tr,
                          style: CustomTextStyles.bodySmallGray80002,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 35.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 5.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "lbl_refer_and_learn".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 23.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBytesizeLink,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 5.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "msg_connected_accounts".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 23.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCarbonStar,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 7.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl_rate_app".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 23.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCarbonShare,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 7.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl_share_app".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 23.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIcOutlinePrivacyTip,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 7.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl_privacy_policy".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 23.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgClaritySignOutLine,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 7.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl_sign_out".tr,
                      style: CustomTextStyles.bodyLargeGray80002,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 50.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 26.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_my_profile".tr,
        margin: EdgeInsets.only(left: 20.h),
      ),
    );
  }
}
