import 'package:training/core/app_export.dart';
import 'package:training/presentation/home_page/models/course.dart';

abstract class showcoursecontroller extends GetxController{
  


}


class showcoursecontrollerImg extends showcoursecontroller{

 late course  Course ;

intialData(){
 Course =Get.arguments['Course'];
}

@override
  void onInit() {
intialData();
    super.onInit();
  }


}