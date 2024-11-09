import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:training/core/app_export.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class HandlingDataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataview({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageConstant.m1,repeat:true ))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(ImageConstant.Net,repeat:true ))

            : statusRequest == StatusRequest.serverfailure
               // ? const Center(child: Text("serverfailure..."))
            ? Center(child: Lottie.asset(ImageConstant.s,repeat:true ))
                
                : statusRequest == StatusRequest.failure
                //   ? const Center(child: Text("failure..."))
            ? Center(child: Lottie.asset(ImageConstant.box,repeat:true ))

                    : widget;
  }
}
