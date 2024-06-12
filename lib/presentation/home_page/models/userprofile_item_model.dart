import 'package:training/core/utils/image_constant.dart';

import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel(
      {this.userImage, this.username, this.title, this.description, this.id}) {
    userImage = userImage ?? Rx(ImageConstant.imgUnsplashXyvicrdgwic);
    username = username ?? Rx("Rian Mendella");
    title = title ?? Rx("How to improve Microsoft Excel Skills");
    description = description ??
        Rx("Most people know the power Excel can wield, especially when used properly. But fewer people know how to make the most of Excel...");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? username;

  Rx<String>? title;

  Rx<String>? description;

  Rx<String>? id;
}
