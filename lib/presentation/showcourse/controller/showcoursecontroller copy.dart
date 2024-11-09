import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/My%20Courses/models/data.dart';
import 'package:training/presentation/admin/modle/Course.dart';
import 'package:training/presentation/all_questions/modle/all_questions.dart';
import 'package:training/presentation/all_questions/modle/questions.dart';
import 'package:training/presentation/all_questions/modle/questions.dart';
import 'package:training/presentation/cart/controller/cartcontroller.dart';
import 'package:training/presentation/cart/mycrt.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';
import 'package:training/presentation/showcourse/models/showc.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class showcoursecontroller1 extends GetxController{
  
  //Future<void> goaddshow();



}


class showcoursecontrollerImg1 extends showcoursecontroller1{
// late StatusRequest statusRequest;

 late coursedetails Coursedetails ;
 late coursedetails2 Coursedetails2; 
late SharedPreferences sharedPreferences;
  Myservices myservices = Get.find();
  String ? result;

int ?score;

   late  StatusRequest statusRequest;

 //late department Department;
//  late usercourseregistration Usercourseregistration;
// late TextEditingController phoneController;

//late int  selectcart ;
  Cartcontroller cartcontroller =Get.put(Cartcontroller());

  

  questionsdata cart_data = questionsdata(Get.find());
  showc cart_data1 = showc(Get.find());
  List<questions> data = [];
  List<coursedetails> data1 = [];


     List popular_bloggers1 = [];
     List coursedetails1 = [];
     List coursed = [];
  //List course1 = [];
 // List data = [];
   List department1 = [];
   List coursemedia1 = [];
   List usercourseregistration1 = [];
 List advertisements = [];




intialData(){


 

 //Department =Get.arguments['Department'];
 Coursedetails =Get.arguments['Coursedetails'];
 Coursedetails2 =Get.arguments['Coursedetails2'];
 //data =Get.arguments['data'];

 

}



@override
  void onInit() {
   // Course.courseID=TextEditingController() as int?;
intialData();

 Coursedetails2 =Get.arguments['Coursedetails2'];
 Coursedetails =Get.arguments['Coursedetails'];
 //Course =Get.arguments['Course'];
//String m= Course.courseID.toString();
view();
addview();
update();
viewshow();
 _startTimer();
    super.onInit();
  }

tocart(){
  
          cartcontroller.add(Coursedetails.courseID.toString());
  update();
   Get.offNamed(AppRoutes.CartItemWidget);
  
}
view() async {
  // تحديث حالة التحميل في الواجهة
  statusRequest = StatusRequest.loading;
  update(); 

  try {
    // جلب البيانات باستخدام CourseID
    var response = await cart_data.getquestionsdata(
        Coursedetails.courseID.toString(), Coursedetails.courseID.toString());

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // تنظيف القائمة قبل إضافة البيانات الجديدة
        data.clear();
        
        // تحويل البيانات إلى كائنات من نوع questions
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => questions.fromJson(e)));

        // طباعة البيانات لمراقبة السلوك أثناء التطوير
        print("Data fetched successfully:");
        print(data);
        print("Course ID: ${Coursedetails2.courseID.toString()}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  } catch (e) {
    print("Error occurred: $e");
    statusRequest = StatusRequest.failure;
  }

  // تحديث الواجهة بعد إتمام العملية
  update();
}
addview() async {
  // تحديث حالة التحميل في الواجهة
  statusRequest = StatusRequest.loading;
  update(); 

  try {
    // جلب البيانات باستخدام CourseID
    var response = await cart_data.addresults(
     myservices.sharedPreferences.getString("id").toString() , data[0].examId.toString(),score.toString(),"10");
print(score);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // تنظيف القائمة قبل إضافة البيانات الجديدة
       // data.clear();
        
        // تحويل البيانات إلى كائنات من نوع questions


        // طباعة البيانات لمراقبة السلوك أثناء التطوير
        print("Data fetched successfully:");
        //print(data);
        print("Course ID: ${Coursedetails2.courseID.toString()}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  } catch (e) {
    print("Error occurred: $e");
    statusRequest = StatusRequest.failure;
  }

  // تحديث الواجهة بعد إتمام العملية
  update();
}


  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  late Timer _timer;
  int _start = 300; // Set your countdown time in seconds (e.g., 300 seconds = 5 minutes)

 

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start > 0) {
            _start--;
            update();
        }else {
        timer.cancel();
        // Here you can handle what happens when the time is up
        Get.snackbar('تنبيه', 'وقت الامتحان قد انتهى!', snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
  


  viewshow() async {
  // تحديث حالة التحميل في الواجهة
  statusRequest = StatusRequest.loading;
  update(); 

  try {
    // جلب البيانات باستخدام CourseID
    var response = await cart_data1.showview(
        //Course.courseID.toString()
      "1"  ),
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data1.clear();
      // course1.addAll(response['course']);
   
    coursedetails1.addAll(response['coursedetails']);

    coursemedia1.addAll(response['coursemedia']);  
        // تحويل البيانات إلى كائنات من نوع questions
      //  List responsedata = response['data'];
     //   data1.addAll(responsedata.map((e) => coursedetails.fromJson(e)));

        // طباعة البيانات لمراقبة السلوك أثناء التطوير
        print("Data fetched successfully:");
        print(data);
        print("Course ID: ${Coursedetails2.courseID.toString()}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  } catch (e) {
    print("Error occurred: $e");
    statusRequest = StatusRequest.failure;
  }

  // تحديث الواجهة بعد إتمام العملية
  update();
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