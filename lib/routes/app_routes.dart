


import 'package:training/presentation/home_page/test.view.dart';
import 'package:training/presentation/login/login.dart';
import 'package:training/presentation/signup/models/crud.dart';

import '../Verification/VerifyCodePage.dart';
import '../Verifiy/Verify.dart';
import '../checkemail/checkemail .dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/home_container_screen/binding/home_container_binding.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/login/binding/initialBinding.dart';
import '../presentation/signup/sign_up.dart';
import '../resetpassword2/resetpassword.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String homeContainerScreen = '/home_container_screen';

static const String t='/TestView';


  static const String sign_up = '/signup1';
  static const String VerifyCodesinup = '/VerifyCodePage';
  static const String Verify1 = '/Verify';
  static const String CheckEmail = '/CheckEmailPage';
  static const String ResetPassword = '/ResetPasswordPage';
//--------------------home ----------------------------------

  static const String homePage = '/home_page';

//--------------------------------------------------------------
  static const String iphone11ProMaxTenPage = '/iphone_11_pro_max_ten_page';
  static const String Login = '/LoginWidget';

  static const String iphone11ProMaxTwelvePage =
      '/iphone_11_pro_max_twelve_page';

  static const String iphone11ProMaxFourteenPage =
      '/iphone_11_pro_max_fourteen_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';
  late Crud  crud;
  
  static List<GetPage> pages = [
     
    GetPage(
      name: t,
      page: () => TestView(),
      bindings: [InitialBinding()],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [HomeContainerBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
     GetPage(
      name: Login,
      page: () => LoginP(),
   //   bindings: [AppNavigationBinding()],
    ),
       GetPage(
      name: VerifyCodesinup,
      page: () => VerifyCodePage(),
   //   bindings: [AppNavigationBinding()],
    ),
  GetPage(
      name: Verify1,
      page: () => Verify(),
   //   bindings: [AppNavigationBinding()],
    ),
       GetPage(
      name: CheckEmail,
      page: () => CheckEmailPage(),
   //   bindings: [AppNavigationBinding()],
    ),
      GetPage(
      name: ResetPassword,
      page: () => ResetPasswordPage(),
   //   bindings: [AppNavigationBinding()],
    ),
    
     GetPage(
      
  name: sign_up,
  page: () => signup1(),
  bindings: [InitialBinding()],
),

      

    GetPage(
      name: initialRoute,
      page: () => HomeContainerScreen(),
      bindings: [HomeContainerBinding()],
    )
  ];
}
