
import 'package:training/presentation/cart/mycrt.dart';

class Data {
  String? userID;
  String? courseID;
  String? courseIDCourse;
  String? courseTitle;
  String? courseDescription;
  String? startDate;
  String? endDate;
  String? evaluation;
  String? Image_courese;

  

  Data(
      {this.userID,
      this.courseID,
      this.courseIDCourse,
      this.courseTitle,
      this.courseDescription,
      this.startDate,
      this.endDate,
      this.evaluation,
      this.Image_courese

      });

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    courseID = json['CourseID'];
    courseIDCourse = json['CourseID_Course'];
    courseTitle = json['CourseTitle'];
    courseDescription = json['CourseDescription'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    evaluation = json['evaluation'];
    Image_courese = json['Image_courese'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['CourseID'] = courseID;
    data['CourseID_Course'] = courseIDCourse;
    data['CourseTitle'] = courseTitle;
    data['CourseDescription'] = courseDescription;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['evaluation'] = evaluation;
    data['Image_courese'] = Image_courese;
    return data;
  }

  void addAll(Iterable<Mycrt> map) {}
}