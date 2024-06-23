import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:training/presentation/home_page/controller/test_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/advertisements.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/onlineworld_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'models/viewhierarchy_item_model.dart';
import 'widgets/onlineworld_item_widget.dart';
import 'widgets/userprofile_item_widget.dart';
import 'widgets/viewhierarchy1_item_widget.dart';
import 'widgets/viewhierarchy_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );
        
//final HomeControllerImp controller1 = Get.put(HomeControllerImp(HomeModel().obs));
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
      final TestController controller1 = Get.put(TestController());
 
@override
Widget build(BuildContext context) {
  // Ensure HomeControllerImp is initialized
  
  return SafeArea(
    child: Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppBar(),
      body:
          // Debug print to check if controller is null
    
       SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 3.v),
              child: Column(
                children: [

                  _buildHeroSection(),
                 // SizedBox(height: 21.v),
        // buildDepartmentList(),
                     SizedBox(height: 21.v),
                     
                  _buildCategoriesSection(),
                  SizedBox(height: 21.v),
                 _buildTopCoursesSection(),
                  SizedBox(height: 21.v),
                 _buildPopularBlogsSection(),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        
      ),
    );
  
}

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 54.v,
      title: AppbarSubtitle(
        text:
         "lbl_hello_liza".tr,
        margin: EdgeInsets.only(left: 26.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearch,
          margin: EdgeInsets.fromLTRB(30.h, 17.v, 30.h, 19.v),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildHeroSection() {
    return SizedBox(
      height: 203.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
         // Obx(
         //   () =>
             CarouselSlider.builder(
              options: CarouselOptions(
                height: 203.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                },
              ),
              itemCount://controller.department.length,
            
             controller.homeModelObj.value.onlineworldItemList.value.length,
              itemBuilder: (context, index, realIndex) {
                OnlineworldItemModel model = controller
                    .homeModelObj.value.onlineworldItemList.value[index];
                    
                return OnlineworldItemWidget(
                  model, depar:advertisements.fromJson(controller.advertisements[index]) ,
                );
              },
            ),
         // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Container(
                height: 6.v,
                margin: EdgeInsets.only(bottom: 14.v),
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.sliderIndex.value,
                  count: controller
                      .homeModelObj.value.onlineworldItemList.value.length,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                    spacing: 4,
                    activeDotColor: appTheme.whiteA700,
                    dotHeight: 6.v,
                    dotWidth: 6.h,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCategoriesSection() {
    department d;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: Text(

           // "${controller1.Department[][]}",
            "lbl_categories".tr,
            style: CustomTextStyles.bodyLargeGray80002,
          ),
        ),
        SizedBox(height: 12.v),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height:79.v,// 69.v,
            child: //Obx(
            //  () => 
              GetBuilder<HomeController>(
                builder:(controller) {
             return   ListView.separated(
                            
                  padding: EdgeInsets.only(left: 25.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width:7.h, //7.h,
                    );
                  },
                  itemCount: controller.homeModelObj.value.viewhierarchyItemList.value.length,//controller.department.length,
                  itemBuilder: (context, index) {
                 
                    ViewhierarchyItemModel model = controller
                        .homeModelObj.value.viewhierarchyItemList.value[index];
                       return   HandlingDataview(statusRequest: controller.statusRequest, widget: 
                        
                   ViewhierarchyItemWidget(
                      model, dep: department.fromJson(controller.department1[index]),
                      
                    ));
                  },
                );
                }
              ),
            ),
          ),
       // )
      ],
    );
  }

  /// Section Widget
  Widget _buildTopCoursesSection() {
    coursedetails  Coursedetails ;
    return 
    
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: Text(
            "lbl_top_courses".tr,
            style: CustomTextStyles.bodyLargeGray80002,
          ),
        ),
        SizedBox(height: 12.v),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height:190.v, //181.v,
            child:// Obx(
             // () => 
           /**
            *    GetBuilder<HomeControllerImp>(builder: (controller1) {

    return 
    ListView.builder(
              itemCount: controller1.department.length,
              itemBuilder: (context, index) {
                return  Text("${controller1.department[index]}");
               
              },
            ); 
          
          
          
          
       
        }), */
             
              GetBuilder<HomeController>(
              builder:(controller) {
              return HandlingDataview(statusRequest: controller.statusRequest, widget:   
            
              ListView.separated(
                  padding: EdgeInsets.only(left: 25.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15.h,
                    );
                  },
                  itemCount:controller.course1.length,
                 // controller.Department.length,
                //  controller.homeModelObj.value.viewhierarchy1ItemList.value.length,
                  itemBuilder: (context, index) {
              /**
               *     
                   Viewhierarchy1ItemModel model = controller
                        .homeModelObj.value.viewhierarchy1ItemList.value[index];
                
               */
                   
                
                    return  //Text("${controller.Department[index]}");
                    
                        
                    
                     Viewhierarchy1ItemWidget(
                   //model,
                    Course: course.fromJson(controller.course1[index]),
                    Coursedetails:coursedetails.fromJson(controller.coursedetails1[index]), 
                    Department:department.fromJson(controller.course1[index]),
                    ); 
                 },
              )  );
                 },
              ),

            ),
        ),
     //  )
      ],
    );
  }

  /// Section Widget
  Widget _buildPopularBlogsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: Text(
            "lbl_popular_blogs".tr,
            style: CustomTextStyles.bodyLargeGray80002,
          ),
        ),
        SizedBox(height: 12.v),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height:142.v, //121.v,
            child:// Obx(
              //() => 
              ListView.separated(
                padding: EdgeInsets.only(left: 25.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.h,
                  );
                },
                itemCount:controller.popular_bloggers.length, //controller.homeModelObj.value.userprofileItemList.value.length,
                itemBuilder: (context, index) {
                  UserprofileItemModel model = controller
                      .homeModelObj.value.userprofileItemList.value[index];
                  return UserprofileItemWidget(
                    model, popular: popular_bloggers.fromJson(controller.popular_bloggers[index]),
                  );
                },
              ),
            ),
          ),
      //  )
      ],
    );

    
  }
}/**
 * 
Widget buildDepartmentList() {

  return GetBuilder<TestController>(builder: (controller) {

    return HandlingDataview( statusRequest : controller.statusRequest,widget: ListView.builder(
              itemCount: controller.department.length,
              itemBuilder: (context, index) {
                return  Text("${controller.department[index]}");
               
              },
            ),  
          
          
          
          );
       
        });



      
}

 */