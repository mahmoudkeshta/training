import 'package:training/core/network/linkapi.dart';
import 'package:training/presentation/signup/models/crud.dart';

class PopularBloggers {
  final Crud crud;

  PopularBloggers(this.crud);

  Future postCourseVideoData(String courseID, String videoURL, String description) async {
    var response = await crud.postData(AppLink.PopularBloggers, {
      "courseID": courseID,
      "videoURL": videoURL,
      "description": description,
    });
    return response.fold((l) => l, (r) => r);
  }
}
