
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:training/core/network/linkapi.dart';
import 'package:training/localization/localizationcontroller.dart';
import 'package:training/routes/app_routes.dart';
import 'package:training/theme/custom_button_style.dart';

class language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    localizationcontroller controller =Get.put(localizationcontroller());

  return Scaffold(
    body: Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Choose Language",style: Theme.of(context).textTheme.headlineLarge),
         ElevatedButton(onPressed: (){
          controller.changelang("ar");
          Get.offNamed(AppRoutes.Login1);
         }, child:                  const Text('Ar',style: TextStyle(color: Colors.black87),),),
         ElevatedButton(onPressed: (){
          controller.changelang("en");
                   Get.offNamed(AppRoutes.Login1);




         }, child:                  const Text('En',style: TextStyle(color: Colors.black87),),)
        ],
      ),
    ),
  );
  }

}