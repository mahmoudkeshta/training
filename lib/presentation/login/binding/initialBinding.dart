import 'package:get/get.dart';
import 'package:training/presentation/signup/models/crud.dart';

class InitialBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
