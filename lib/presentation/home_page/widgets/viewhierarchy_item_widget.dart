import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/viewhierarchy_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable


class ViewhierarchyItemWidget extends StatefulWidget {
  department Department;
 course Course;

  ViewhierarchyItemWidget(this.viewhierarchyItemModelObj,  {super.key, required this.Department,required this.Course
  });

  ViewhierarchyItemModel viewhierarchyItemModelObj;

  var controller = Get.find<HomeController>();
  @override
  _ViewhierarchyItemWidgetState createState() => _ViewhierarchyItemWidgetState();
}

class _ViewhierarchyItemWidgetState extends State<ViewhierarchyItemWidget> {
  final HomeController controller = Get.find<HomeController>();
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
  bool _isExpanded = false;
 Color co=Colors.black;
  @override
  Widget build(BuildContext context) {
    double w = 195;
   
    return InkWell(
  
      onDoubleTap: (){
      
       setState(() {
          _isExpanded = !_isExpanded;
     
        });
        
      },
      onTap: () {
             co=const Color.fromRGBO(33, 150, 243, 1);
          setState(() {
        
        });
        controller.gotolistDepartment(widget.Course, widget.Department);
       
      },
      child: HandlingDataview(
        statusRequest: controller.statusRequest,
        widget: AnimatedContainer(
             curve: Curves.bounceOut,
          duration: const Duration(seconds: 1),
          width: _isExpanded ? 250 : w, // تغيير العرض عند التوسع
          padding: EdgeInsets.all(17.h),
          decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                        style: TextStyle(fontSize: 16,color:co),
                        duration: const Duration(seconds: 2),
                        child: Text(
                          "${widget.Department.name}", // استخدام المتغير
                         // style: CustomTextStyles.labelLargeGray80002Bold,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Obx(
                        () => Text(
                          widget.viewhierarchyItemModelObj.text2!.value,
                          style: CustomTextStyles.bodySmallGray80002,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 28.v,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 35.h, bottom: 4.v),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                     
                     // Obx(
                        //() => 
                       
                  CachedNetworkImage(
        imageUrl: "${ widget.Department.image_department!}",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),

                     // ),
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