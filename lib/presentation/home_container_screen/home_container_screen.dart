import 'package:flutter/material.dart';
import 'package:training/presentation/home_page/models/course.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_page/home_page.dart';
import '../My Profile/myprofile.dart';
import '../My Courses/mycourses.dart';
import '../blogs/iphone_11_pro_max_twelve_page.dart';
import 'controller/home_container_controller.dart'; // ignore_for_file: must_be_immutable
class HomeContainerScreen extends GetWidget<HomeContainerController> {
  const HomeContainerScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: Container(
        child: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.h),
        child: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
     
        
//String  Course =Get.arguments['Course'];
 

 //Department =Get.arguments['Department'];
// String Coursedetails =Get.arguments['Coursedetails'];
//String Coursedetails2 =Get.arguments['Coursedetails2'];
        Get.toNamed(
          getCurrentRoute(type),
          id: 1,
          arguments: {
            //"Course": Course,
           // "Coursedetails": Coursedetails,
         //   "Coursedetails2": Coursedetails2,
          },
        );
      },
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Mycourses:
        return AppRoutes.Mycourses;
      case BottomBarEnum.Blogs:
        return AppRoutes.iphone11ProMaxTwelvePage;
      case BottomBarEnum.Myprofile:
        return AppRoutes.iphone11ProMaxFourteenPage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.Mycourses:
        return mycourses(); // تأكد من استدعاء الصفحة الصحيحة
      case AppRoutes.iphone11ProMaxTwelvePage:
        return Iphone11ProMaxTwelvePage();
      case AppRoutes.iphone11ProMaxFourteenPage:
        return myprofile();
      default:
        return DefaultWidget();
    }
  }
}
