import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_page/home_page.dart';
import '../iphone_11_pro_max_fourteen_page/iphone_11_pro_max_fourteen_page.dart';
import '../iphone_11_pro_max_ten_page/iphone_11_pro_max_ten_page.dart';
import '../iphone_11_pro_max_twelve_page/iphone_11_pro_max_twelve_page.dart';
import 'controller/home_container_controller.dart'; // ignore_for_file: must_be_immutable

class HomeContainerScreen extends GetWidget<HomeContainerController> {
  const HomeContainerScreen({Key? key})
      : super(
          key: key,
        );
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.h),
          child: _buildBottomNavigation(),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Mycourses:
        return AppRoutes.iphone11ProMaxTenPage;
      case BottomBarEnum.Blogs:
        return AppRoutes.iphone11ProMaxTwelvePage;
      case BottomBarEnum.Myprofile:
        return AppRoutes.iphone11ProMaxFourteenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.iphone11ProMaxTenPage:
        return Iphone11ProMaxTenPage();
      case AppRoutes.iphone11ProMaxTwelvePage:
        return Iphone11ProMaxTwelvePage();
      case AppRoutes.iphone11ProMaxFourteenPage:
        return Iphone11ProMaxFourteenPage();
      default:
        return DefaultWidget();
    }
  }
}
