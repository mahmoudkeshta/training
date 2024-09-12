import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/services.dart';

/**
 * class AuthMiddleWare extends GetMiddleware {
  SharedPreferences ? sharepref;


@override
RouteSettings? redirect(String? route) {
 if ( sharepref!.getString('step') != null )
return RouteSettings(name: "/home_page") ;
}
}
 */