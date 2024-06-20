
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';

abstract class HomeController extends GetxController {
  HomeController(this.homeModelObj,this.Course);
//final m= "".obs;

 List advertisements = [];

     List popular_bloggers = [];
  List course1 = [];
  List data = [];
   List department = [];
  var isLoading = true.obs;
  Rx<HomeModel> homeModelObj;
  Myservices myservices = Get.find();
  Homedata homedata = Homedata(Get.find());
  String? username;
  String? id;
    course Course;
  gotoshowcourse( course Course );

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
      department.addAll(response['department']);
    
    course1.addAll(response['course']);
    advertisements.addAll(response['advertisements']);
   // popular_bloggers.addAll(response['popular_bloggers']);

    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

  }


  
}


class HomeControllerImp extends HomeController {

 
  HomeControllerImp(Rx<HomeModel> homeModelObj) : super(homeModelObj,course());
  @override
  initialData() {
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
  }
  
  @override
  gotoshowcourse(Course) {
 Get.toNamed(AppRoutes.show_course,arguments: {
  "Course":Course
 });

  }
}
