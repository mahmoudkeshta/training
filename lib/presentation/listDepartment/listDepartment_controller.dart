import 'package:get/get.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class listDepartment_controller extends GetxController{


}
 class listDepartment_controllerImg extends listDepartment_controller{
late StatusRequest statusRequest;
 late course  Course ;

 late department Department;


  
  
  
@override
  void onInit() {
   // Course.courseID=TextEditingController() as int?;
intialData();

    super.onInit();
  }




intialData(){
 Course =Get.arguments['Course'];
    

 Department =Get.arguments['Department'];

  

}

}
