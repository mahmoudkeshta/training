import 'package:training/core/app_export.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';

abstract class BloggerCard extends GetxController{
  
  //Future<void> goaddshow();



}


class BloggerCardImg extends BloggerCard{

    late popular_bloggers Popular_bloggers;
  



intialData(){
 
 Popular_bloggers =Get.arguments['Popular_bloggers'];
  

}

@override
  void onInit() {
   // Course.courseID=TextEditingController() as int?;
intialData();

    super.onInit();
  }
  /**
   * 
  @override
  Future<void> goaddshow() async{
  
    var response = await showc.postDate(
      

    );
   
    statusRequest = handlingData(response);
 
        
    if (statusRequest == StatusRequest.success) {
        Get.toNamed(AppRoutes.VerifyCodesinup );
      if (response['status'] == "Success") {
       
     
        
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Phone number already exists");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

   */

}