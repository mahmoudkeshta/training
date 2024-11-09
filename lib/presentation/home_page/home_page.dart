import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/Search/search1.dart';
import 'package:training/presentation/home_page/controller/favoritecontroller.dart';
import 'package:training/presentation/home_page/controller/test_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/advertisements.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/home_page/widgets/viewhierarchy1_item_widget%20copy.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
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
  HomePage({super.key});
        
//final HomeControllerImp controller1 = Get.put(HomeControllerImp(HomeModel().obs));
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
      final TestController controller1 = Get.put(TestController());
 favoritecontroller con=Get.put(favoritecontroller());

 
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
              child:
              
               Column(
                children: [

                  _buildHeroSection(),
                 // SizedBox(height: 21.v),
        // buildDepartmentList(),
                     SizedBox(height: 21.v),
                     
                  _buildCategoriesSection(),
                  SizedBox(height: 21.v),
                 _buildTopCoursesSection(),
             
                  SizedBox(height: 21.v),
                  
                _buildTopCoursesSection1(controller.a,0),
                  SizedBox(height: 21.v),

                 _buildTopCoursesSection1(controller.a1,1),
                  SizedBox(height: 21.v),

                _buildTopCoursesSection1(controller.a2,2),
              
               //

                  SizedBox(height: 21.v),
  _buildTopCoursesSection1(controller.a6,4),
                  SizedBox(height: 21.v),
 // _buildTopCoursesSection1(controller.a4,3),

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
Myservices myservices=Get.find();
String? username = myservices.sharedPreferences.getString("username");
  String? step = myservices.getStep();

   return CustomAppBar(
  height: 54.v,
  title: AppbarSubtitle(
    text: username != null ? "Welcome back $username" : "Welcome Guest",
    // "lbl_hello_liza".tr, // Uncomment and use this if you want to use translations
    margin: EdgeInsets.only(left: 26.h),
  ),
  actions: [
    IconButton(onPressed: (){Get.toNamed(AppRoutes.productListScreen);}, icon: const Icon(Icons.search_outlined)),
      IconButton(onPressed: (){
        Get.toNamed(AppRoutes.Favorites_App);
      }, icon: const Icon(Icons.favorite_border_outlined)),
        IconButton(onPressed: (){
              Get.toNamed(AppRoutes.CartItemWidget);
        }, icon: const Icon(Icons.card_membership_outlined)),
   /**
    *  AppbarTrailingImage(
      imagePath: ImageConstant.imgSearch,
      margin: EdgeInsets.fromLTRB(30.h, 17.v, 30.h, 19.v),
    ),
    */
   
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
  itemCount: controller.homeModelObj.value.onlineworldItemList.value.length,
  itemBuilder: (context, index, realIndex) {
    // Check if advertisements is not empty and index is within bounds
    if (index < controller.advertisements.length) {
      OnlineworldItemModel model = controller
          .homeModelObj.value.onlineworldItemList.value[index];

      return OnlineworldItemWidget(
        model,
        depar: advertisements.fromJson(controller.advertisements[index]),
      );
    } else {
      // Handle the case when there are more items than advertisements
      return Container(); // Return an empty container or a placeholder
    }
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
    return 
    
    Column(
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
                               if (index >= controller.course1.length ||
    index >= controller.coursedetails1.length ||
    index >= controller.department1.length ||
    index >= controller.coursemedia1.length // Make sure to add this check as well
) {
  return const SizedBox(); // Return an empty box or handle the error gracefully
}
                    ViewhierarchyItemModel model = controller
                        .homeModelObj.value.viewhierarchyItemList.value[index];
                       return   HandlingDataview(statusRequest: controller.statusRequest, widget: 
                        
                   ViewhierarchyItemWidget(
                      model, Department: department.fromJson(controller.department1[index]), Course: course.fromJson(controller.course1[index]),
                      
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
                  itemCount:controller.coursed.length,
                 // controller.Department.length,
                //  controller.homeModelObj.value.viewhierarchy1ItemList.value.length,
                  itemBuilder: (context, index) {
              /**
               *     
                   Viewhierarchy1ItemModel model = controller
                        .homeModelObj.value.viewhierarchy1ItemList.value[index];
                
               */
                    if (index >= controller.course1.length ||
    index >= controller.coursedetails1.length ||
    
    index >= controller.coursemedia1.length ||
    index >= controller.coursed.length 
     // Make sure to add this check as well
) {
  return SizedBox(); // Return an empty box or handle the error gracefully
}
                
                    return  //Text("${controller.Department[index]}");
                    
                        
                    
                     Viewhierarchy1ItemWidget(
                   //model,
                    Course: course.fromJson(controller.course1[index]),
                    Coursedetails:coursedetails.fromJson(controller.coursedetails1[index]), 
                   // Department:department.fromJson(controller.department1[index]), 
                    Coursemedia: coursemedia.fromJson(controller.coursemedia1[index]),
                     Coursedetails2: coursedetails2.fromJson(controller.coursed[index]), 
                    ); 
                 },
              )  );
                 },
              ),

            ),
        ),
     //  )
      ],
    );}
Widget _buildTopCoursesSection1(var m, int cun) {
  // Check if department list is valid and avoid redundant checks
  final isDepartmentValid = controller.department1 != null && controller.department1!.isNotEmpty && cun < controller.department1!.length;

  return HandlingDataview(
    statusRequest: controller.statusRequest,
    widget: Padding(
      padding: EdgeInsets.only(left: 0, right: 25.h, top: 20.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
         
          Padding(
            padding:  EdgeInsets.only(left: 25.h),
            child: Text(
              isDepartmentValid ? "${controller.department1![cun]['Name']}" : "No data available",
              style: CustomTextStyles.bodyLargeGray80002,
                 
            ),
          ),
          SizedBox(height: 12.v),

          // Display course list if available
          if (controller.coursed.isEmpty) 
            Text("No courses available", style: CustomTextStyles.bodyLargeGray80002)
          else
            SizedBox(
              height: 190.v,
              child: ListView.builder(
                //padding: EdgeInsets.only(right: 15.h),
                scrollDirection: Axis.horizontal,
                itemCount: controller.coursed.length,
                itemBuilder: (context, index) {
                  // Check bounds before accessing the lists
                  if (index >= controller.course1.length ||
                      index >= m.length ||
                      index >= controller.coursemedia1.length) {
                    return const SizedBox();
                  }
                  con.isFavorite[controller.coursed[index]['CourseID']] = controller.coursed[index]['favorite'];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Viewhierarchy1ItemWidget1(
                    //  Course: course.fromJson(controller.course1[index]),
                      Coursedetails: coursedetails.fromJson(m[index]),
                      Coursemedia: coursemedia.fromJson(controller.coursemedia1[index]),
                      Coursedetails2: coursedetails2.fromJson(controller.coursed[index]),
                    ),
                  );
                },
              ),
            ),
          SizedBox(height: 1.v),
        ],
      ),
    ),
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
              GetBuilder<HomeController>(builder: (controller){
            return ListView.separated(
                padding: EdgeInsets.only(left: 25.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.h,
                  );
                },
                itemCount:controller.popular_bloggers1.length, //controller.homeModelObj.value.userprofileItemList.value.length,
                itemBuilder: (context, index) {
/**
 *                   UserprofileItemModel model = controller
                      .homeModelObj.value.userprofileItemList.value[index];
 */
                  return UserprofileItemWidget(
                   // model, 
                    popular: popular_bloggers.fromJson(controller.popular_bloggers1[index]),
                  );
                },
              );}
            ),
          ),
       )
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
