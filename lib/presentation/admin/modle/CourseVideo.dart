import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class CourseVideo {
  Crud crud;
  CourseVideo(this.crud);

  Future postCourseVideoData(String courseID, String videoURL, String description) async {
    var response = await crud.postData(AppLink.coursevideo, {
      "courseID": courseID,
      "videoURL": videoURL,
      "description": description,
    });
    return response.fold((l) => l, (r) => r);
  }
}
