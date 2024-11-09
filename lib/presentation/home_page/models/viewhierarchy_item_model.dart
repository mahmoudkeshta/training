
import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchy_item_widget] screen.

class ViewhierarchyItemModel {
  ViewhierarchyItemModel(
      {this.text1, this.text2, this.image1, this.image2, this.id}) {
    text1 = text1 ?? Rx("Cyber Security");
    text2 = text2 ?? Rx("145 Courses");
    image1 = image1 ?? Rx(ImageConstant.imgCheckmark);
    image2 = image2 ?? Rx(ImageConstant.imgVector);
    id = id ?? Rx("");
  }

  Rx<String>? text1;

  Rx<String>? text2;

  Rx<String>? image1;

  Rx<String>? image2;

  Rx<String>? id;
}
