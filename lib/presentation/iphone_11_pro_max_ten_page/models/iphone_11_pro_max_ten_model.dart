import '../../../core/app_export.dart';
import 'courselist_item_model.dart';

/// This class defines the variables used in the [iphone_11_pro_max_ten_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Iphone11ProMaxTenModel {
  Rx<List<CourselistItemModel>> courselistItemList = Rx([
    CourselistItemModel(
        machineLearning: "Macine Learning".obs,
        machineLearning1:
            "The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers..."
                .obs,
        hoursLeftText: "4 hours left".obs,
        percentageText: "40%".obs,
        startLearningTe: "Start Learning".obs),
    CourselistItemModel(
        machineLearning: "Data Science".obs,
        machineLearning1:
            "Most people know the power Excel can wield, especially when used properly. But fewer people know how to make..."
                .obs,
        hoursLeftText: "2 hours left".obs,
        percentageText: "60%".obs,
        startLearningTe: "Start Learning".obs)
  ]);
}
