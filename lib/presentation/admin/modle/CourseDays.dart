import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class CourseDays {
  Crud crud;
  CourseDays(this.crud); // تصحيح اسم الفئة ومنشئها

  Future postCourseData(String dayOfWeekArabic, String dayOfWeek, String courseID) async {
    var response = await crud.postData(AppLink.coursedays, {
      "DayOfWeekArabic": dayOfWeekArabic,
      "DayOfWeek": dayOfWeek,
      "CourseID": courseID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
