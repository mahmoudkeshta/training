import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';

import 'package:training/presentation/admin/modle/CourseVideo.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

abstract class VideoPageController extends GetxController {
  Future<void> addVideo();
}

class VideoPageControllerImg extends VideoPageController {
  late StatusRequest statusRequest;
  late TextEditingController courseIDController;
  late TextEditingController videoURLController;
  late TextEditingController descriptionController;
  
  late CourseVideo courseVideo;

  bool isButtonEnabled = false;

  List data = [];

  @override
  void onInit() {
    super.onInit();
    courseVideo = CourseVideo(Get.find());

    courseIDController = TextEditingController();
    videoURLController = TextEditingController();
    descriptionController = TextEditingController();

    courseIDController.addListener(_checkIfButtonShouldBeEnabled);
    videoURLController.addListener(_checkIfButtonShouldBeEnabled);
    descriptionController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void onClose() {
    courseIDController.dispose();
    videoURLController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  @override
  Future<void> addVideo() async {
    // تأكد من أن الحقول ليست فارغة قبل إرسال الطلب
    if (courseIDController.text.isEmpty ||
        videoURLController.text.isEmpty) {
      Get.defaultDialog(title: "Warning", middleText: "Please fill all fields");
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await courseVideo.postCourseVideoData(
      courseIDController.text,
      videoURLController.text,
      descriptionController.text
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.defaultDialog(title: "Success", middleText: response['message'] ?? 'Video added successfully');
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
    isButtonEnabled = courseIDController.text.isNotEmpty &&
                      videoURLController.text.isNotEmpty;
    update();
  }
}
