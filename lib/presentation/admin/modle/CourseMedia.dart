import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class CourseMedia {
  Crud crud;
  CourseMedia(this.crud);

  Future postCourseMediaData(String courseID, String mediaType, String mediaURL, String description) async {
    var response = await crud.postData(AppLink.coursemedia, {
      "courseID": courseID,
      "mediaType": mediaType,
      "mediaURL": mediaURL,
      "description": description,
    });
    return response.fold((l) => l, (r) => r);
  }
}
