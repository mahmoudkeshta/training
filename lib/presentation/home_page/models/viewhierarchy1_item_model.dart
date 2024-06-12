import 'package:training/core/utils/image_constant.dart';

import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchy1_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Viewhierarchy1ItemModel {
  Viewhierarchy1ItemModel(
      {this.dataScienceImag,
      this.dataScienceText,
      this.ratingText,
      this.learnerText,
      this.id}) {
    dataScienceImag =
        dataScienceImag ?? Rx(ImageConstant.imgUnsplashMHrflhgabo);
    dataScienceText = dataScienceText ?? Rx("Data Science");
    ratingText = ratingText ?? Rx("4.6");
    learnerText = learnerText ?? Rx("10.5k Learners");
    id = id ?? Rx("");
  }

  Rx<String>? dataScienceImag;

  Rx<String>? dataScienceText;

  Rx<String>? ratingText;

  Rx<String>? learnerText;

  Rx<String>? id;
}
