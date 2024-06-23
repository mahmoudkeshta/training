
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/department.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';

abstract class HomeController extends GetxController {
  HomeController(this.homeModelObj,this.Course,this.Coursedetails,this.Department);
//final m= "".obs;

 List advertisements = [];

     List popular_bloggers = [];
     List coursedetails1 = [];
  List course1 = [];
  List data = [];
   List department1 = [];
   
  var isLoading = true.obs;
  Rx<HomeModel> homeModelObj;
  Myservices myservices = Get.find();
  Homedata homedata = Homedata(Get.find());
  String? username;
  String? id;
    course Course;
    coursedetails Coursedetails;
    department Department;
  gotoshowcourse( course Course, coursedetails  Coursedetails,department Department);

 late StatusRequest statusRequest;



  Rx<int> sliderIndex = 0.obs;
  initialData();

  @override
  void onInit() {
    initialData();
    getdara();
    super.onInit();
  }

  

    getdara() async {
   statusRequest =  StatusRequest.loading;
   // Update the UI to reflect loading state

    var response = await homedata.getDate();
   
    statusRequest = handlingData(response);

    if ( StatusRequest.success == statusRequest ) {
    if(response['status']=="success"){
      department1.addAll(response['department']);
    
    course1.addAll(response['course']);
    advertisements.addAll(response['advertisements']);
    coursedetails1.addAll(response['coursedetails']);
   // popular_bloggers.addAll(response['popular_bloggers']);

    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

  }


  
}


class HomeControllerImp extends HomeController {

 
  HomeControllerImp(Rx<HomeModel> homeModelObj) : super(homeModelObj,course(),coursedetails(),department());
  @override
  initialData() {
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
  }
  
  @override
  // ignore: non_constant_identifier_names
  gotoshowcourse(Course,Coursedetails,Department) {
 Get.toNamed(AppRoutes.show_course,arguments: {
  "Course":Course,
  "Coursedetails":Coursedetails,
  "Department":Department,
 });

  }
}
