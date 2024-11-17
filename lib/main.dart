import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:training/core/network/linkapi.dart';
import 'package:training/core/network/services.dart';
import 'package:training/core/utils/logger.dart';
import 'package:training/core/utils/size_utils.dart';
import 'package:training/localization/app_localization.dart';
import 'package:training/localization/localizationcontroller.dart';
import 'package:training/presentation/cart/cart.dart';
import 'package:training/presentation/showcourse/controller/showcoursecontroller.dart';
import 'package:training/presentation/signup/binding/initialBinding.dart';
import 'package:training/routes/app_routes.dart';
import 'package:training/stripe_payment/stripe_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    
  // Initialize your services or perform any async initialization
  await initialServices();
WidgetsFlutterBinding.ensureInitialized();
  // Ensure portrait orientation
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    // Initialize logger based on release mode
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
 //Stripe.publishableKey=ApiKeys.pusblishablekey;
  
    // Run your app
    runApp(MyApp());
  });
}

/**void changeStatusBarColor(Color color) {
  FlutterStatusbarcolor.setStatusBarColor(color);

  // Determine if status bar icons should be light or dark based on the color brightness
  bool useWhiteForeground = color.computeLuminance() < 0.5; // Light colors will have dark icons
  FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
} **/


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    localizationcontroller controller =Get.put(localizationcontroller());
    // Change status bar color to desired color
//   changeStatusBarColor(const Color.fromRGBO(212, 157, 47, 1)); // مثال لتغيير اللون إلى الأبيض

    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define your app's theme
          primarySwatch: Colors.pink,
          // Other theme properties
        ),
        // Localization settings
        translations: AppLocalization(),
        locale:controller.Language, //Get.deviceLocale,
        //fallbackLocale: const Locale('en', 'ar'),
        title: 'Your App Title',
      //  initialRoute: AppRoutes.Login,
        getPages: AppRoutes.pages,
      );
    });
  }
}