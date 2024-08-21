import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';
class Course {
  Crud crud;
  Course(this.crud);

  Future postCourseData(String title, String description, String locationID, String adminID, String startDate, String endDate, String imageCourse, String evaluation) async {
    var response = await crud.postData(AppLink.course, {
      "title": title,
      "description": description,
      "locationID": locationID,
      "adminID": adminID,
      "startDate": startDate,
      "endDate": endDate,
      "imageCourse": imageCourse,
      "evaluation": evaluation,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future updateCourseData(int courseId, String title, String description, String locationID, String adminID, String startDate, String endDate, String imageCourse, String evaluation) async {
    var response = await crud.postData("${AppLink.update_course}/$courseId", {
      "title": title,
      "description": description,
      "locationID": locationID,
      "adminID": adminID,
      "startDate": startDate,
      "endDate": endDate,
      "imageCourse": imageCourse,
      "evaluation": evaluation,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future deleteCourseData(int courseId) async {
    var response = await crud.postData("${AppLink.delete_course}/$courseId/delete", {});
    return response.fold((l) => l, (r) => r);
  }
}
