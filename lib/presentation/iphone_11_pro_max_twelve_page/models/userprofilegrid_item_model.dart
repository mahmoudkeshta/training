import '../../../core/app_export.dart';

/// This class is used in the [userprofilegrid_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofilegridItemModel {
  UserprofilegridItemModel(
      {this.dataScienceImag,
      this.dataScienceText,
      this.excelSkillsText,
      this.twentyKText,
      this.dateText,
      this.id}) {
    dataScienceImag =
        dataScienceImag ?? Rx(ImageConstant.imgUnsplash5fnmwej4taa);
    dataScienceText = dataScienceText ?? Rx("Data Science");
    excelSkillsText = excelSkillsText ?? Rx("How to improve Excel Skills");
    twentyKText = twentyKText ?? Rx("20k");
    dateText = dateText ?? Rx("28 Jan 2021");
    id = id ?? Rx("");
  }

  Rx<String>? dataScienceImag;

  Rx<String>? dataScienceText;

  Rx<String>? excelSkillsText;

  Rx<String>? twentyKText;

  Rx<String>? dateText;

  Rx<String>? id;
}
