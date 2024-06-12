import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';


class HandlingDataview extends StatelessWidget{
 final StatusRequest statusRequest;
 final Widget widget;

  const HandlingDataview( {key, required this.statusRequest, required this.widget});


  @override
  Widget build(BuildContext context) {
    return
    statusRequest == StatusRequest.loading ?
      const Center(child: Text("offlinefailure...")):
    // Center(child: Lottie.asset(AppImageAsset.root1)):
    statusRequest == StatusRequest.offlinefailure ?
    const Center(child: Text("offlinefailure...")):
        statusRequest == StatusRequest.serverfailure ?
    const Center(child: Text("serverfailure...")):
            statusRequest == StatusRequest.failure ?
    const Center(child: Text("failure...")):
    widget;
  }

}