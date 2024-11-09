import 'package:flutter/material.dart';
import 'package:training/core/utils/image_constant.dart';
import 'package:training/core/utils/size_utils.dart';
import 'package:training/theme/custom_text_style.dart';
import 'package:training/theme/theme_helper.dart';
import 'package:training/widgets/custom_image_view.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Home, Mycourses, Blogs, Myprofile }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key, this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyCourses,
      activeIcon: ImageConstant.imgNavMyCourses,
      title: "lbl_my_courses".tr,
      type: BottomBarEnum.Mycourses,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBlogs,
      activeIcon: ImageConstant.imgNavBlogs,
      title: "lbl_blogs".tr,
      type: BottomBarEnum.Blogs,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyProfile,
      activeIcon: ImageConstant.imgNavMyProfile,
      title: "lbl_my_profile".tr,
      type: BottomBarEnum.Myprofile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87.v,//48
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    color: appTheme.gray80002,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.bodySmallGray8000210.copyWith(
                        color: appTheme.gray80002,
                      ),
                    ),
                  )
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelMediumOnPrimary.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  )
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 146, 12, 12),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}