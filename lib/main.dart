import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training/core/network/services.dart';
import 'package:training/core/utils/logger.dart';
import 'package:training/core/utils/size_utils.dart';
import 'package:training/localization/app_localization.dart';
import 'package:training/presentation/login/binding/initialBinding.dart';
import 'package:training/routes/app_routes.dart';
import 'package:training/theme/theme_helper.dart';

import 'core/app_export.dart';

void main() async{
  
   WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    

  
    runApp(MyApp());

  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialBinding: InitialBinding(),
    debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale,
           
        fallbackLocale: Locale('en', 'US'),
        title: 'mdjnd_s_application5',
       
        initialRoute://AppRoutes.t,
        AppRoutes.Login,
        getPages: AppRoutes.pages,
      );
    });
  }
}
