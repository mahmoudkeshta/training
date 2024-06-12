import '../../../core/app_export.dart';

/// This class is used in the [onlineworld_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OnlineworldItemModel {
  OnlineworldItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
