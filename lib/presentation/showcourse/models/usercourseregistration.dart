class usercourseregistration {
  int? userID;
  int? courseID;

  usercourseregistration({this.userID, this.courseID});

  usercourseregistration.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    courseID = json['CourseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['CourseID'] = courseID;
    return data;
  }
}