class usercourseregistration {
  int? userID;
  int? courseID;

  usercourseregistration({this.userID, this.courseID});

  usercourseregistration.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    courseID = json['CourseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['CourseID'] = this.courseID;
    return data;
  }
}