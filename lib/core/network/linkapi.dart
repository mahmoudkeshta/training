class AppLink {
//static const String server = "https://aletharsociety.com/ecommercecourse-PHP--master";// For Android Emulator192.168.43.152
  static const String server = "https://mahmoud.freewebhostmost.com/ecommercecourse-PHP--master";// For Android Emulator192.168.43.152
  //static const String server = "http://192.168.70.102/ecommercecourse-PHP--master";// For Android Emulator192.168.43.152
  
//  static const String server = "http://192.168.1.153/ecommercecourse-PHP--master";// For Android Emulator192.168.43.152
  //static const String server = "http://192.168.1.133/ecommercecourse-PHP--master"; 
//http://192.168.1.153/
  // For Android Emulator
  // static const String server = "http://localhost/ecommercecourse-PHP--master"; // For iOS Simulator
  static const String test = "$server/test.php";
  static const String items = "$server/items.php";
    static const String key="API_KEY=3fwdfsdferff3";
  static const String test2 = "$server/test2.php";
  static const String signup = "$server/aurh/signup.php";
  static const String login = "$server/aurh/login.php";
  static const String verifycode = "$server/aurh/verifycode.php";
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword = "$server/forgetpassword/resetpassword.php";
  static const String verify = "$server/forgetpassword/verifycode.php";


  //-----------------------home---------------------------
static const String home = "$server/home.php?$key";
  static const String search = "$server/items/search.php";
  static const String course = "$server/course/create.php";
  static const String update_course = "$server/course/update_course.php";
  static const String delete_course = "$server/course/delete_course.php";
  static const String coursedays = "$server/course/coursedays.php?$key";
  static const String coursevideo = "$server/course/coursevideo.php";
  static const String coursemedia = "$server/course/courseMedia.php";
  static const String PopularBloggers = "$server/course/PopularBloggers.php";
  static const String h = "$server/h.php";

//----------------favorite
  static const String favoriteremove = "$server/favorite/remove.php";
  static const String favoriteadd = "$server/favorite/add.php";
  static const String favoriteview = "$server/favorite/view.php";

  static const String deletefromfavorite = "$server/favorite/deletefavorite.php";



  static const String sendemail = "$server/sendemail.php";


  ///CART 
  static const String cartremove = "$server/cart/removecart.php";
  static const String cartadd = "$server/cart/cart.php";
  static const String det = "$server/cart/del.php";


  
  static const String cartview = "$server/cart/view.php";
  static const String showcourse = "$server/showmy.php";
  static const String questionsdata = "$server/exams/exams.php";
  static const String addresults = "$server/exams/r.php";
  static const String viewgrades = "$server/exams/grades.php";


/// show 
  static const String show = "$server/course/show.php";


}
