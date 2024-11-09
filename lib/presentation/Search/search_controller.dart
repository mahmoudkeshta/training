import 'dart:async';
import 'package:get/get.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:training/presentation/Search/searchdata.dart';
import 'package:training/presentation/home_page/models/coursedetails.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';

class SearchController1 extends GetxController {
  var data = <coursedetails>[].obs;
  var statusRequest = StatusRequest.loading.obs;
  var searchText = ''.obs;
  var selectedCategory = ''.obs;
  Timer? _debounce;
  final datasearch cartData = datasearch(Get.find());

  // Update search text with debounce and initiate search
  void updateSearchText(String query, {String? category}) {
    searchText.value = query;
    selectedCategory.value = category ?? '';

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), search);
  }

  // Execute search request
  Future<void> search() async {
    statusRequest.value = StatusRequest.loading;
    data.clear();

    if (searchText.value.isEmpty) {
      statusRequest.value = StatusRequest.failure;
      return;
    }

    final response = await cartData.datasearchON(searchText.value);
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.assignAll(responsedata.map((e) => coursedetails.fromJson(e)).toList());
      } else {
        statusRequest.value = StatusRequest.failure;
      }
    }
  }
}
