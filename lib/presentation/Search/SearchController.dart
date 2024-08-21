import 'package:get/get.dart';
import 'search_controller.dart'; 
class SearchController extends GetxController {
  var searchText = ''.obs;

  void updateSearchText(String text) {
    searchText.value = text;
  }
}