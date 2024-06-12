import 'package:flutter/material.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  popular_bloggers popular;
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key, required this.popular})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() =>
                 CustomImageView(
                  imagePath: userprofileItemModelObj.userImage!.value,
                  height: 121.v,
                  width: 117.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(10.h),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  top: 9.v,
                  bottom: 7.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Obx(() =>
                       Text(
                       "${popular.bloggerName}",
                        //userprofileItemModelObj.username!.value,
                        style: CustomTextStyles.bodySmallGray80002Light,
                      ),
                   // ),
                    SizedBox(height: 2.v),
                    SizedBox(
                      width: 84.h,
                      child: //Obx(
                        //() => 
                        Text(
                        "${popular.title}",
                    
                         // userprofileItemModelObj.title!.value,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray80002,
                        ),
                     // ),
                    ),
                    SizedBox(
                      width: 102.h,
                      child: //Obx( () =>
                         Text(
                              "${popular.paragraphText}",
                          //userprofileItemModelObj.description!.value,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray800028,
                        ),
                      ),
                   // )
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
