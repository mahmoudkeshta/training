


import 'package:training/core/network/services.dart';
import 'package:training/localization/language.dart';
import 'package:training/presentation/BloggerCard/BloggerCard.dart';
import 'package:training/presentation/My%20Courses/mycourses.dart';
import 'package:training/presentation/Search/search1.dart';
import 'package:training/presentation/admin/admin.dart';
import 'package:training/presentation/all_questions/ResultsScreen.dart';
import 'package:training/presentation/cart/cart.dart';
import 'package:training/presentation/cart/cartdata.dart';
import 'package:training/presentation/favorite/FavoritesApp.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';
import 'package:training/presentation/home_page/test.view.dart';
import 'package:training/presentation/listDepartment/listDepartment.dart';
import 'package:training/presentation/login/login.dart';
import 'package:training/presentation/showcourse/showcourse2.dart';
import 'package:training/presentation/signup/models/crud.dart';
import 'package:training/presentation/showcourse/showcourse.dart';
import 'package:training/profile/profile.dart';

import '../presentation/Verification/VerifyCodePage.dart';
import '../presentation/Verifiy/Verify.dart';
import '../presentation/checkemail/checkemail .dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/home_container_screen/binding/home_container_binding.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/login/binding/initialBinding.dart';
import '../presentation/signup/sign_up.dart';
import '../presentation/resetpassword2/resetpassword.dart'; // ignore_for_file: must_be_immutable

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
  static const String bloggerCard = '/BloggerCard';
   static const String ListDepartment="/listDepartment";

//--------------------------------------------------------------
  static const String Mycourses = '/mycourses';
  static const String Login = '/LoginWidget';
  static const String Login1= '/LoginP';

  static const String iphone11ProMaxTwelvePage =
      '/iphone_11_pro_max_twelve_page';

  static const String iphone11ProMaxFourteenPage =
    '/iphone_11_pro_max_fourteen_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String show_course = '/CourseDetailScreen';
  static const String show_course2 = '/CourseDetailScreen2';

  static const String initialRoute = '/initialRoute';
  static const String Favorites_App = '/FavoritesApp';

  //----------
  static const String CartItemWidget = '/CartItemWidget';
  static const String Language = '/language';
  static const String profilePage = '/ProfilePage';
  static const String admin = '/Admin';
  static const String resultsScreen = '/ResultsScreen';
  static const String productListScreen = '/ProductListScreen';
  


  
  late Crud  crud;
  late popular_bloggers bl;
  
  static List<GetPage> pages = [
     
   /**
    *  GetPage(
      name: t,
      page: () => TestView(),
      bindings: [InitialBinding()],
    ),
    */ GetPage(
      name: productListScreen,
      page: () =>  ProductListScreen(),
    

     
    ),
    
      GetPage(
      name: resultsScreen,
      page: () =>  ResultsScreen(),
    

     
    ),

       GetPage(
      name: admin,
      page: () =>  Admin(),
    

     
    ),
     GetPage(
      name: "/",
      page: () =>  language(),
    

     
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => const HomeContainerScreen(),
      bindings: [HomeContainerBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => const AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
     GetPage(
      name: Login1,
      page: () => LoginP(),
   middlewares: [ AuthMiddleware()]
      
   //   bindings: [AppNavigationBinding()],
    ),
       GetPage(
      name: VerifyCodesinup,
      page: () => VerifyCodePage(),
   //   bindings: [AppNavigationBinding()],
    ),
        GetPage(
      name: profilePage,
      page: () => ProfilePage(),

    ),
      GetPage(
      name: show_course,
      page: () => CourseDetailScreen(),
   //   bindings: [AppNavigationBinding()],
    ),
       GetPage(
      name: show_course2,
      page: () => CourseDetailScreen2(),
   //   bindings: [AppNavigationBinding()],
    ),



      GetPage(
      name: Mycourses,
      page: () => mycourses(),
   //   bindings: [AppNavigationBinding()],
    ),
      GetPage(
      name: bloggerCard,
      page: () => BloggerCard(),
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
      
  name: ListDepartment,
  page: () => listDepartment(),
 // bindings: [InitialBinding()],
),


    GetPage(
      name: initialRoute,
      page: () => const HomeContainerScreen(),
      bindings: [HomeContainerBinding()],

    ),

     GetPage(
      name: CartItemWidget,
      page: () => CartPage(),
      bindings: [HomeContainerBinding()],
    ),

      GetPage(
      name: Favorites_App,
      page: () => FavoritesApp(),
     // bindings: [HomeContainerBinding()],
    )
  ];
}
