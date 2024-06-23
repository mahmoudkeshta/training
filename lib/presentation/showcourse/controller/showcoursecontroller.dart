import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

abstract class showcoursecontroller extends GetxController{
  


}


class showcoursecontrollerImg extends showcoursecontroller{
 late StatusRequest statusRequest;
 late course  Course ;
 late coursedetails Coursedetails ;
  late department Department;
   



intialData(){
 Course =Get.arguments['Course'];
    

 Department =Get.arguments['Department'];
 Coursedetails =Get.arguments['Coursedetails'];
  

}

@override
  void onInit() {
intialData();

    super.onInit();
  }


}