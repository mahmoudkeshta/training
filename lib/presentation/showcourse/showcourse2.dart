import 'dart:async';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/My%20Courses/models/data.dart';
import 'package:training/presentation/home_page/controller/favoritecontroller.dart';

import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/HandlingDataview.dart';
import 'package:training/presentation/home_page/models/course.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/home_page/models/coursedetails1.dart';

import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/showcourse/VideoPlayerScreen.dart';
import 'package:training/presentation/showcourse/controller/CountdownScreen.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller%20copy.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';
import 'package:training/presentation/showcourse/models/coursemedia.dart';
import 'package:training/presentation/showcourse/models/usercourseregistration.dart';
import 'package:training/routes/app_routes.dart';

void main() {
  runApp(MaterialApp(
    home: CourseDetailScreen2(),
  ));
}

class CourseDetailScreen2 extends StatelessWidget {
 late SharedPreferences sharedPreferences;



 final showcoursecontrollerImg1 controller = Get.put(showcoursecontrollerImg1());
  var arguments = Get.arguments;
    late coursedetails2 Coursedetails2;
    late usercourseregistration Usercourseregistration;
late Data data;
    
final favoritecontroller con=Get.put(favoritecontroller());
   final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));

  CourseDetailScreen2({super.key});
  // String   course = Get.arguments['Course'] ; 

 //final Course = Get.Course;
 

  @override
  Widget build(BuildContext context) {
    var m=controller.Coursedetails.courseID;
    return
              HandlingDataview(statusRequest: controller1.statusRequest, widget:
     DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
         Row(children: [

            Text(
            //"${controller.Coursedetails2.favorite}",
          
           "${controller.Coursedetails.courseTitle}",
           // "l",
            overflow: TextOverflow.ellipsis,
           style: const TextStyle(color: Colors.black),
          ),
          const Spacer(),
        GetBuilder<favoritecontroller>(builder: (con)=>
       IconButton(onPressed: (){
      if(con.isFavorite[ controller.Coursedetails.courseID]=="1"){
            con.setfavorite(controller.Coursedetails.courseID,"0");
 con.addfavorite( "${controller.Coursedetails.courseID}");

      }else{
            con.setfavorite(controller.Coursedetails.courseID,"1");
          
           con.removefavorite("${controller.Coursedetails.courseID}");

            
      }

       }, icon: Icon(
     // (  con.isFavorite[ controller.Coursedetails2.courseID] == "1" )?
    //   controller.Coursedetails2.favorite == 1 ?
 (con.isFavorite[m]== "1"  ?

     Icons.favorite : Icons.favorite_border_outlined 
       ),
       color: Colors.red,))
             )    ],)
          
        
        ),
        body: 
 
        
        Column(
          children: [
            Image.network("${controller.Coursedetails.Image_courese}"), // Replace with your image asset
             
              Text(
                
             "${controller.Coursedetails.courseTitle}",
                style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                Text(  "${controller.Coursedetails.evaluation}"
                ,style: const TextStyle(color: Colors.black87),),
                const SizedBox(width: 16),
                const Text('10.5k Learners',style: TextStyle(color: Colors.black87),),
  

                ],
            ),
            
            const TabBar(
              tabs: [
                Tab(text: 'Overview', ),
                Tab(text: 'Lectures'),
                Tab(text: 'Dates Courses'),
               // Tab(text: 'Dates Courses'),
              ],
            
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OverviewTab(),
                  LecturesTab(),
                  SimilarCoursesTab(),
                 // ExamScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class OverviewTab extends StatelessWidget {
 final showcoursecontrollerImg1 controller = Get.put(showcoursecontrollerImg1());

Myservices myservices=Get.find();

  OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
   final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));

String? id = myservices.sharedPreferences.getString("id");
String? username = myservices.sharedPreferences.getString("username");
String? email = myservices.sharedPreferences.getString("email");
    return 
    
    
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            //SizedBox(height: 16),
            const Text(
              'What will I learn?',
           
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
           "${controller.Coursedetails.courseDescription}",
                   style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ratings and Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                 "${controller.Coursedetails.evaluation}"
                  ,style: const TextStyle(color: Colors.black87),),
                const SizedBox(width: 8),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star_half, color: Colors.orange),
                const Icon(Icons.star_border),
                const SizedBox(width: 8),
                const Text('3 reviews',style: TextStyle(color: Colors.black87),),
              ],
            ),
            const SizedBox(height: 16),
           Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Center(
      child: 
        "${controller1.Usercourseregistration.userID}" == "30" 
        ? ElevatedButton(
            onPressed: () {
              var arguments = Get.arguments;
              final String zoomUrl = "${controller.Coursedetails.courseURL}";
              controller.launchURL(zoomUrl);
            },
            child: const Text(
              'Start Learning',
              style: TextStyle(color: Colors.black87),
            ),
          )
        : ElevatedButton(
            onPressed: () {
           //  controller.cartcontroller.add(controller.Coursedetails.courseID.toString());
              controller.tocart();
              
            },
            child: Text(
              'Pay now ${controller.Coursedetails.price} AED',
              style: TextStyle(color: Colors.black87),
            ),
          ),
    ),
    const SizedBox(width: 10), // Spacer between buttons
    Center(
      child: ElevatedButton(
        onPressed: () {
          // Add to cart action
          
              controller.cartcontroller.add(controller.Coursedetails.courseID.toString());

        },
        child: const Text(
          'Add to cart',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    ),
  ],
),
        ])
      ),
    );

  }
}




class LecturesTab extends StatelessWidget {
   final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));

  LecturesTab({super.key});
// Assuming HomeController extends GetxController
 
@override
  Widget build(BuildContext context) {
  return GetBuilder<HomeController>(
    init: controller1,
    builder: (controller) {
      return HandlingDataview(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          // Ensure the itemCount is the smallest list length
          itemCount: min(controller.coursemedia1.length, controller.coursedetails1.length),
          itemBuilder: (BuildContext context, int index) {
            return Show(
              Coursemedia: coursemedia.fromJson(controller.coursemedia1[index]),
             // Course: course.fromJson(controller.course1[index]),
            );
          },
        ),
      );
    },
  );
}
}
class Show extends StatelessWidget {
final showcoursecontrollerImg1 controller1 = Get.put(showcoursecontrollerImg1());
 
// Fetch the Myservices instance
 // Access 'id' from sharedPreferences
// Access 'email'


  @override
 final HomeController controller = Get.put(HomeControllerImp(HomeModel().obs));
coursemedia Coursemedia;
 //course Course;
 
  var arguments = Get.arguments;


   Show({
    super.key,
    required this.Coursemedia
    ,//required this.Course
  });
Myservices myservices=Get.find();

  @override
  Widget build(BuildContext context) {
  String? id = myservices.sharedPreferences.getString("id");
String? username = myservices.sharedPreferences.getString("username");
String? email = myservices.sharedPreferences.getString("email");

    return 
      Coursemedia.courseID==controller1.Coursedetails.courseID   ?
    ExpansionTile(
    title: Text(
       "${Coursemedia.mediaType}",
    )
    ,
    subtitle: Text("${Coursemedia.description}"),
    children: <Widget>[
    //  ListTile(title: Text("${Coursemedia.mediaURL}")),
    ListTile(title: 
    const InkWell(child: Text('Sub lecture '))
    
    ,onTap: () {
     controller.Usercourseregistration.userID.toString() == id?
      Coursemedia.mediaURL != "" ?
      Get.to(VideoPlayerScreen(videoUrl: '${Coursemedia.mediaURL}',) ):  Get.snackbar(
        'Error',
        'No content available',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error),

      )
      : Get.snackbar(
        'Error',
        'I have to subscribe first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(Icons.lock),
        
      ); 
    },),
   //   ListTile(title: Text('Sub lecture 3')),
   //   ListTile(title: Text('Sub lecture 4')),
    ],
              ):Container();
  }
}

class SimilarCoursesTab extends StatelessWidget {
  final showcoursecontrollerImg1 controller = Get.put(showcoursecontrollerImg1());
 final HomeController controller1 = Get.put(HomeControllerImp(HomeModel().obs));
  var arguments = Get.arguments;

  SimilarCoursesTab({super.key});
 

  @override
  Widget build(BuildContext context) {
    return 
    
    HandlingDataview(statusRequest: controller1.statusRequest, widget: 
    Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
            const Text(
              'Dates Courses',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Table(
              border: TableBorder.all(
                color: Colors.grey,
                width: 1.0,
              ),
              children: [
              
                _buildTableRow('Description', '${controller.Coursedetails.departmentName}', Colors.green),
/***
 *                 _buildTableRow('Start Date', '2024-06-01', Colors.orange),
                _buildTableRow('End Date', '2024-06-15', Colors.yellow),
 */
              //  _buildTableRow('Evaluation', '4.1', Colors.red),
                _buildTableRow('Admin Name', "${controller.Coursedetails.adminName}", Colors.purple),
              //  _buildTableRow('Course Title', 'Course 2', Colors.blue),
                _buildTableRow('Session Date', '${controller.Coursedetails.sessionDate}', Colors.green),
                _buildTableRow('Start Date', '${controller.Coursedetails.startDate}', const Color.fromARGB(255, 255, 152, 0)),
                _buildTableRow('End Date', '${controller.Coursedetails.endDate}', Colors.yellow),
                _buildTableRow('Day Of Week', '${controller.Coursedetails.dayOfWeek}', Colors.purple),
              //  _buildTableRow('course URL', '${controller.Coursedetails.courseURL}', Colors.purple),
              ],
            ),

              ElevatedButton(
                onPressed: () {

    Get.to(CountdownScreen());

  
                },
                
                child:   
                
                 Text('Start ِِExam',style: TextStyle(color: Colors.black87),),
              )
          ],
        ),
      ),
     ) 
       );
  }

  TableRow _buildTableRow(String label, String value, Color color) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            color: color.withOpacity(0.1),  // إضافة شفافية للألوان
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            color: color.withOpacity(0.1),  // إضافة شفافية للألوان
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class ExamScreen extends StatelessWidget {
  final showcoursecontrollerImg controller = Get.put(showcoursecontrollerImg());
  final List<int?> selectedOptions = [];
  
  late Timer _timer;
  int _start = 300; // 5 دقائق
  int currentPage = 0;
  final int questionsPerPage = 1;
  bool allowBackNavigation = false;

  ExamScreen() {
    _checkIfExamCompleted(); // تحقق من حالة الامتحان
    for (int i = 0; i < controller.data.length; i++) {
      selectedOptions.add(null);
    }
    _startTimer();
  }

  Future<void> _checkIfExamCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isCompleted = prefs.getBool('examCompleted');
    if (isCompleted == true) {
      Get.snackbar('تنبيه', 'لقد أكملت الامتحان من قبل ولا يمكنك إعادته!');
      Future.delayed(Duration(seconds: 1), () 
      {
       Get.offNamed(AppRoutes.show_course); 
// العودة إلى الشاشة السابقة
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        _start--;
        controller.update();
      } else {
        timer.cancel();
        Get.snackbar('انتهاء الوقت', 'انتهى وقت الامتحان!');
        allowBackNavigation = false;
        controller.update();
      }
    });
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < controller.data.length; i++) {
      if (selectedOptions[i] == int.parse(controller.data[i].correctOption!)) {
        score++;
      }
    }
    return score;
  }

  Future<void> _submitExam() async {
 

     controller.score = calculateScore();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('examCompleted', true); // تخزين حالة الامتحان

     controller.result = controller.score! >= (controller.data.length / 2) ? 'ناجح' : 'راسب';
 Get.offNamed(AppRoutes.show_course); 
  controller.addview();
    // عرض نافذة منبثقة
    Get.defaultDialog(
      title: 'نتيجة الامتحان',
      middleText: 'لقد حصلت على ${controller.score} درجة. أنت ${controller.result}!',
      
      onConfirm: () {
 Get.offNamed(AppRoutes.show_course); 
  

       // العودة إلى الشاشة الرئيسية
      },
      textConfirm: 'موافق',
      
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (controller.data.length / questionsPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        title: Text('الامتحان'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(212, 157, 47, 1),
      ),
      body: GetBuilder<showcoursecontrollerImg>(
        builder: (controller) {
          final startIndex = currentPage * questionsPerPage;
          final endIndex = (startIndex + questionsPerPage).clamp(0, controller.data.length);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'الوقت المتبقي: ${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: endIndex - startIndex,
                  itemBuilder: (context, index) {
                    final question = controller.data[startIndex + index];

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question ${startIndex + index + 1}: ${question.questionText}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            RadioListTile<int>(
                              title: Text('${question.option1}'),
                              value: 1,
                              groupValue: selectedOptions[startIndex + index],
                              onChanged: (value) {
                                selectedOptions[startIndex + index] = value;
                                controller.update();
                              },
                            ),
                            RadioListTile<int>(
                              title: Text('${question.option2}'),
                              value: 2,
                              groupValue: selectedOptions[startIndex + index],
                              onChanged: (value) {
                                selectedOptions[startIndex + index] = value;
                                controller.update();
                              },
                            ),
                            RadioListTile<int>(
                              title: Text('${question.option3}'),
                              value: 3,
                              groupValue: selectedOptions[startIndex + index],
                              onChanged: (value) {
                                selectedOptions[startIndex + index] = value;
                                controller.update();
                              },
                            ),
                            RadioListTile<int>(
                              title: Text('${question.option4}'),
                              value: 4,
                              groupValue: selectedOptions[startIndex + index],
                              onChanged: (value) {
                                selectedOptions[startIndex + index] = value;
                                controller.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (allowBackNavigation && currentPage > 0)
                    TextButton(
                      onPressed: () {
                        currentPage--;
                        controller.update();
                      },
                      child: Text('السابق'),
                    ),
                  if (currentPage < totalPages - 1)
                    TextButton(
                      onPressed: () {
                        currentPage++;
                        controller.update();
                      },
                      child: Text('التالي'),
                    ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _submitExam,
        label: Text('إرسال الإجابات'),
        icon: Icon(Icons.send),
        backgroundColor: Color.fromRGBO(212, 157, 47, 1),
      ),
    );
  }
}