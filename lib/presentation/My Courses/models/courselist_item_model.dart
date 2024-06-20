import '../../../core/app_export.dart';

/// This class is used in the [courselist_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CourselistItemModel {
  CourselistItemModel(
      {this.machineLearning,
      this.machineLearning1,
      this.hoursLeftText,
      this.percentageText,
      this.startLearningTe,
      this.id}) {
    machineLearning = machineLearning ?? Rx("Macine Learning");
    machineLearning1 = machineLearning1 ??
        Rx("The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers...");
    hoursLeftText = hoursLeftText ?? Rx("4 hours left");
    percentageText = percentageText ?? Rx("40%");
    startLearningTe = startLearningTe ?? Rx("Start Learning");
    id = id ?? Rx("");
  }

  Rx<String>? machineLearning;

  Rx<String>? machineLearning1;

  Rx<String>? hoursLeftText;

  Rx<String>? percentageText;

  Rx<String>? startLearningTe;

  Rx<String>? id;
}
