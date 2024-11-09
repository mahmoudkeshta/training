import 'package:flutter/material.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/favorite/favorite.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class favoritecontroller extends GetxController{
Map  isFavorite ={};

 late StatusRequest statusRequest;


 setfavorite( id ,val){
isFavorite[id]=val;
update();

 }



favoritedata Favoritedata= favoritedata(Get.find()) ;
 List data =[];
 Myservices myservices =Get.find();
 
 addfavorite( String itemid) async{

statusRequest =  StatusRequest.loading;
   // Update the UI to reflect loading state
var userId = myservices.sharedPreferences.getString("id").toString() ; 

    var response = await Favoritedata.addfavorite(userId, itemid);
   
    statusRequest = handlingData(response);

    if ( StatusRequest.success == statusRequest ) {
    if(response['status']=="success"){
  Get.rawSnackbar(messageText: const Text("  add favorite"));
  
    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }

 }
removefavorite(String itemid)async{
  update();
statusRequest =  StatusRequest.loading;
   // Update the UI to reflect loading state
var userId = myservices.sharedPreferences.getString("id").toString() ; 
    var response = await Favoritedata.removefavorite(userId, itemid);
   
    statusRequest = handlingData(response);

    if ( StatusRequest.success == statusRequest ) {
    if(response['status']=="success"){
     Get.rawSnackbar(messageText: const Text(" ---ok remove favorite"));


    }else{
      statusRequest = StatusRequest.failure;
    }
       update(); 
    }
}

}