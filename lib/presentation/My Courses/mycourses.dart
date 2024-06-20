import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/iphone_11_pro_max_ten_controller.dart';
import 'models/courselist_item_model.dart';
import 'models/iphone_11_pro_max_ten_model.dart';
import 'widgets/courselist_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class mycourses extends StatelessWidget {
  mycourses({Key? key})
      : super(
          key: key,
        );

  Iphone11ProMaxTenController controller =
      Get.put(Iphone11ProMaxTenController(Iphone11ProMaxTenModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [SizedBox(height: 10.v), _buildCourseList(), Spacer()],
          ),
        ),
      ),
    );
  }

  /// Section Widget
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

  /// Section Widget
  Widget _buildCourseList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
        () => ListView.separated(
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
                  color: appTheme.black900,
                ),
              ),
            );
          },
          itemCount: controller
              .iphone11ProMaxTenModelObj.value.courselistItemList.value.length,
          itemBuilder: (context, index) {
            CourselistItemModel model = controller.iphone11ProMaxTenModelObj
                .value.courselistItemList.value[index];
            return CourselistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
