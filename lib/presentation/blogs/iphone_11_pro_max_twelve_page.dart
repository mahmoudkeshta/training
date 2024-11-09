import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/iphone_11_pro_max_twelve_controller.dart';
import 'models/iphone_11_pro_max_twelve_model.dart';
import 'models/userprofilegrid_item_model.dart';
import 'widgets/userprofilegrid_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Iphone11ProMaxTwelvePage extends StatelessWidget {
  Iphone11ProMaxTwelvePage({super.key});

  Iphone11ProMaxTwelveController controller =
      Get.put(Iphone11ProMaxTwelveController(Iphone11ProMaxTwelveModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: 25.h,
            top: 10.v,
            right: 25.h,
          ),
          child: Obx(
            () => GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 192.v,
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.iphone11ProMaxTwelveModelObj.value
                  .userprofilegridItemList.value.length,
              itemBuilder: (context, index) {
                UserprofilegridItemModel model = controller
                    .iphone11ProMaxTwelveModelObj
                    .value
                    .userprofilegridItemList
                    .value[index];
                return UserprofilegridItemWidget(
                  model,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_blogs".tr,
        margin: EdgeInsets.only(left: 26.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchBlack900,
          margin: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 5.v,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }
}
