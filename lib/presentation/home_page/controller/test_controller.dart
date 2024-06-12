import 'package:get/get.dart';

import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/home_page/controller/test.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class TestController extends GetxController {
 TestData testData =TestData(Get.find());
  //List data = [];
 List department=[].obs;
 List course=[];
 List advertisements=[];
   late  StatusRequest statusRequest;

  

getData() async {
  statusRequest = StatusRequest.loading;
   // Update the UI to reflect loading state

    var response = await testData.getDate();
   
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
    if(response['status']=="success"){
       //data.addAll(response['data']);
       department.addAll(response['department']);
       course.addAll(response['course']);
       advertisements.addAll(response['advertisements']);
    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

   // Update the UI to reflect new data or error state
  }
  @override
  void onInit() {
    getData();
    super.onInit();
    
    
    // Find the registered TestData instance
   
    
  }
}
