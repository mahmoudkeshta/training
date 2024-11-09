import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/all_questions/ResultsScreen.dart';
import 'package:training/widgets/app_bar/appbar_leading_image.dart';
import 'package:training/widgets/app_bar/appbar_subtitle.dart';
import 'package:training/widgets/app_bar/custom_app_bar.dart';
import '../../core/app_export.dart';
import 'controller/iphone_11_pro_max_fourteen_controller.dart';
import 'models/iphone_11_pro_max_fourteen_model.dart';

class myprofile extends StatelessWidget {
  myprofile({super.key});

  MyCourses controller = Get.put(MyCourses());
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    String? id = myservices.sharedPreferences.getString("id");
    String? username = myservices.sharedPreferences.getString("username");
    String? email = myservices.sharedPreferences.getString("email");

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 30, // تكبير الصورة الرمزية
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      username?.substring(0, 1).toUpperCase() ?? 'U',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username ?? 'Unknown User',
                        style: CustomTextStyles.labelLargeGray80002,
                      ),
                      SizedBox(height: 2),
                      Text(
                        email ?? 'No Email Provided',
                        style: CustomTextStyles.bodySmallGray80002,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35),

              // Menu Items
              _buildMenuItem(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {
                  Get.toNamed(AppRoutes.profilePage);
                },
              ),
              _buildMenuItem(
                icon: Icons.assignment_turned_in_outlined,
                title: "Exam Results",
                onTap: () {
                  Get.toNamed(AppRoutes.resultsScreen);
                },
              ),
              _buildMenuItem(
                icon: Icons.link,
                title: "Connected Accounts",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.star_border,
                title: "Rate App",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.share_outlined,
                title: "Share App",
                onTap: () {
                  Get.off(AppRoutes.resultsScreen);
                },
              ),
              _buildMenuItem(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.logout_outlined,
                title: "Sign Out",
                onTap: () {
                  myservices.sharedPreferences.clear();
                  Get.offAllNamed('/LoginP');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom Widget for Menu Items
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 36, // تكبير الأيقونات
              color: Color.fromRGBO(212, 157, 47, 1), // تغيير اللون إلى أصفر
            ),
            SizedBox(width: 18),
            Text(
              title,
              style: CustomTextStyles.bodyLargeGray80002,
            ),
          ],
        ),
      ),
    );
  }

  /// Custom AppBar Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 50,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(left: 26, top: 5, bottom: 5),
      ),
      title: AppbarSubtitle(
        text: "My Profile",
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }
}
