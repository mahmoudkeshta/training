import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/all_questions/modle/grades.dart';
import 'package:training/presentation/all_questions/modle/questions.dart';

import 'package:training/presentation/signup/models/statusrequest.dart';

class gradescontroller extends GetxController{

  questionsdata cart_data = questionsdata(Get.find());
   late  StatusRequest statusRequest;

  List<grades> data = [];

Myservices myservices =Get.find();

  void onInit() {
    view();

    super.onInit();
  
    
    // Find the registered TestData instance
   
    
  }

  view()async{
 statusRequest = StatusRequest.loading;
   // Update the UI to reflect loading state

       var response = await cart_data.viewgrades(myservices.sharedPreferences.getString("id")!);

   
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
    if(response['status']=="success"){
       //data.addAll(response['data']);
     List responsedata =response['data'];
     data.addAll(responsedata.map((e)=>grades.fromJson(e)));
      print("data-------");
      print(data);
    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

  }
}