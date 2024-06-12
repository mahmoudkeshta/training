import 'package:flutter/material.dart';
import 'package:training/presentation/home_page/models/department.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/viewhierarchy_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ViewhierarchyItemWidget extends StatelessWidget {
//  final department depart;
department dep;
  ViewhierarchyItemWidget(this.viewhierarchyItemModelObj,  {Key? key, required this.dep
  })
      : super(
          key: key,
        );

  ViewhierarchyItemModel viewhierarchyItemModelObj;

  var controller = Get.find<HomeController>();
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:175.h, //173.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(17.h),
          decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Obx(
                  //   () => 
                      Text(
             "${dep.name}",
                    //   " ${controller1.Department[0]['Name']}",
                       // viewhierarchyItemModelObj.text1!.value,
                        style: CustomTextStyles.labelLargeGray80002Bold,
                      ),
                  // ),
                    SizedBox(height: 3.v),
                    Obx(
                      () =>
                      
                       Text(
                        viewhierarchyItemModelObj.text2!.value,
                        style: CustomTextStyles.bodySmallGray80002,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 28.v,
                width: 24.h,
                margin: EdgeInsets.only(
                  left: 35.h,
                  bottom: 4.v,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(
                      () => CustomImageView(
                        imagePath: viewhierarchyItemModelObj.image1!.value,
                        height: 9.v,
                        width:12.h,// 12.h,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 8.v),
                      ),
                    ),
                    Obx(
                      () => CustomImageView(
                        imagePath: viewhierarchyItemModelObj.image2!.value,
                        height: 28.v,//28.v,
                        width: 24.h,
                        alignment: Alignment.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
