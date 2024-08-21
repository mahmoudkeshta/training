import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/presentation/admin/modle/CourseDays.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

abstract class SchedulePageController extends GetxController {
  Future<void> addCourse();
}

class SchedulePageControllerImg extends SchedulePageController {
  late StatusRequest statusRequest;
  late TextEditingController dayOfWeekArabicController;
  late TextEditingController dayOfWeekController;
  late TextEditingController courseIdController;
  
  late CourseDays courseDays;

  bool isButtonEnabled = false;

  List data = [];

  @override
  void onInit() {
    super.onInit();
    courseDays = CourseDays(Get.find());

    dayOfWeekArabicController = TextEditingController();
    dayOfWeekController = TextEditingController();
    courseIdController = TextEditingController();

    dayOfWeekArabicController.addListener(_checkIfButtonShouldBeEnabled);
    dayOfWeekController.addListener(_checkIfButtonShouldBeEnabled);
    courseIdController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    dayOfWeekArabicController.dispose();
    dayOfWeekController.dispose();
    courseIdController.dispose();
    super.onClose();
  }

  @override
  Future<void> addCourse() async {
    // تأكد من أن الحقول ليست فارغة قبل إرسال الطلب
    if (dayOfWeekArabicController.text.isEmpty ||
        dayOfWeekController.text.isEmpty ||
        courseIdController.text.isEmpty) {
      Get.defaultDialog(title: "Warning", middleText: "Please fill all fields");
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await courseDays.postCourseData(
      dayOfWeekArabicController.text,
      dayOfWeekController.text,
      courseIdController.text
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // Handle success scenario, e.g., navigate to another page or show a success message
        Get.defaultDialog(title: "Success", middleText: response['message'] ?? 'Course added successfully');
      } else {
        Get.defaultDialog(title: "Warning", middleText: response['message'] ?? 'Unexpected error');
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  void _checkIfButtonShouldBeEnabled() {
    isButtonEnabled = dayOfWeekArabicController.text.isNotEmpty &&
                      dayOfWeekController.text.isNotEmpty &&
                      courseIdController.text.isNotEmpty;
    update();
  }
}
