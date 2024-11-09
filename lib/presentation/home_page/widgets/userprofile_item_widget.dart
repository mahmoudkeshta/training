import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';

class UserprofileItemWidget extends StatefulWidget {
  final popular_bloggers popular;

  const UserprofileItemWidget({
    super.key,
    required this.popular,
  });

  @override
  _UserprofileItemWidgetState createState() => _UserprofileItemWidgetState();
}

class _UserprofileItemWidgetState extends State<UserprofileItemWidget> {
  final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // بدء الرسوم المتحركة تلقائيًا عند تحميل الصفحة
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }
  

  @override
  Widget build(BuildContext context) {
    double width = _isExpanded ? 270 : 250; // تغيير العرض بناءً على الحالة

    return InkWell(
       
      onDoubleTap: (){
      
       setState(() {
          _isExpanded = !_isExpanded;
     
        });
        
      },
      onTap: () {
        controller.gotopopularbloggers(widget.popular);
      },
      child:
      
       AnimatedContainer(
          curve: Curves.bounceOut,
        duration: const Duration(seconds: 1),
        width: width,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: "${widget.popular.imageUrl}",
                  height: 121.v,
                  width: 117.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(10.h),
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
                      Text(
                        "${widget.popular.bloggerName}",
                        style: CustomTextStyles.bodySmallGray80002Light,
                      ),
                      SizedBox(height: 2.v),
                      SizedBox(
                        width: 84.h,
                        child: Text(
                          "${widget.popular.title}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray80002,
                        ),
                      ),
                      SizedBox(
                        width: 102.h,
                        child: Text(
                          "${widget.popular.paragraphText}",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray800028,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
