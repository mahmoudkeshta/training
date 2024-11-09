import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/My%20Courses/models/data.dart';
import 'package:training/presentation/My%20Courses/models/mycourselist.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

import '../../../core/app_export.dart';
import '../models/iphone_11_pro_max_ten_model.dart';

/// A controller class for the Iphone11ProMaxTenPage.
///
/// This class manages the state of the Iphone11ProMaxTenPage, including the
/// current iphone11ProMaxTenModelObj
class mycourselistc extends GetxController {
  
//late Data Coursedetails;
late course  Course ;
 late coursedetails Coursedetails ;
 late coursedetails2 Coursedetails2; 
late coursemedia Coursemedia;
late SharedPreferences sharedPreferences;
/**gotoshowcour( List data, int selectitem) {
Get.toNamed(AppRoutes.show_course,arguments: {
 "data" :data,
 "selectitem"  :selectitem
});
  
}**/
  List<Data> data = [];
   late  StatusRequest statusRequest;
Myservices myservices =Get.find();
  mycourselist Mycourselist =mycourselist(Get.find());
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));

 @override
  void onInit() {
    getData();

 //Course =Get.arguments['Course'];
 


 //Coursedetails =Get.arguments['Coursedetails'];
// Coursedetails2 =Get.arguments['Coursedetails2'];
    super.onInit();
  
    
    // Find the registered TestData instance
   
    
  }

 
getData() async {
  data.clear();
  statusRequest = StatusRequest.loading;
   // Update the UI to reflect loading state

    var response = await Mycourselist.getDate(myservices.sharedPreferences.getString("id")!);
   
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
    if(response['status']=="success"){
       //data.addAll(response['data']);
     List responsedata =response['data'];
     data.addAll(responsedata.map((e)=>Data.fromJson(e)));
      print("data-------");
     // print(data);
    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

   // Update the UI to reflect new data or error state
  }



  


}
