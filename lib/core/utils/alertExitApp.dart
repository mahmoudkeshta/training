import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io'; // To use exit(0)

 Future<void> alertExitApp() async {
    Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل أنت متأكد أنك تريد الخروج من التطبيق؟", // Optional, add any message if needed
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0); // Closes the app
          },
          child: const Text("تأكيد"), // Confirm button
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(); // Closes the dialog without exiting the app
          },
          child: const Text("إلغاء"), // Cancel button
        ),
      ],
    );
  }