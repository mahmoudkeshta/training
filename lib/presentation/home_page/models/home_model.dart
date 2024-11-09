
import '../../../core/app_export.dart';
import 'onlineworld_item_model.dart';
import 'userprofile_item_model.dart';
import 'viewhierarchy1_item_model.dart';
import 'viewhierarchy_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeModel {
  Rx<List<OnlineworldItemModel>> onlineworldItemList =
      Rx(List.generate(3, (index) => OnlineworldItemModel()));

  Rx<List<ViewhierarchyItemModel>> viewhierarchyItemList = Rx([
    ViewhierarchyItemModel(
        text1: "Cyber Security".obs,
        text2: "145 Courses".obs,
        image1: ImageConstant.imgCheckmark.obs,
        image2: ImageConstant.imgVector.obs),
            ViewhierarchyItemModel(
        text1: "Cyber Security".obs,
        text2: "145 Courses".obs,
        image1: ImageConstant.imgCheckmark.obs,
        image2: ImageConstant.imgVector.obs),
            ViewhierarchyItemModel(
        text1: "Cyber Security".obs,
        text2: "145 Courses".obs,
        image1: ImageConstant.imgCheckmark.obs,
        image2: ImageConstant.imgVector.obs),
       
  ]);
  

  Rx<List<Viewhierarchy1ItemModel>> viewhierarchy1ItemList = Rx([
    Viewhierarchy1ItemModel(
        dataScienceImag: ImageConstant.imgUnsplashMHrflhgabo.obs,
        dataScienceText: "Data Science".obs,
        ratingText: "4.6".obs,
        learnerText: "10.5k Learners".obs),
    Viewhierarchy1ItemModel(
        dataScienceImag: ImageConstant.imgUnsplash58z17lnvs4u.obs,
        dataScienceText: "Machine Learning".obs,
        ratingText: "4.6".obs,
        learnerText: "10.5k Learners".obs),
  ]);

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.imgUnsplashXyvicrdgwic.obs,
        username: "Rian Mendella".obs,
        title: "How to improve Microsoft Excel Skills".obs,
        description:
            "Most people know the power Excel can wield, especially when used properly. But fewer people know how to make the most of Excel..."
                .obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgUnsplash95yrwf6cnw8.obs,
        username: "Liza Nisel".obs,
        title: "Top 10 Java Tools for 2021".obs,
        description:
            "Java is the most widely used high level object oriented programming language across the globe. Oracle Corporation purchased SUN MiCROSYSTEM in 2010..."
                .obs),
               
  ]);
}
