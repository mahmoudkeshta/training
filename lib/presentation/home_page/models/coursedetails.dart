class coursedetails {
  int? courseID;
  String? courseTitle;
  String? courseDescription;
  String? startDate;
  String? endDate;
  String? evaluation;
  int? adminID;
  String? adminName;
  int? departmentID;
  String? departmentName;
  int? sessionID;
  String? sessionDate;
  String? dayOfWeek;
  String? dayOfWeekArabic;
  String? courseDate;
  String? userName;
  int? id;
  String? courseURL;
  String? videoURL;

  coursedetails(
      {this.courseID,
      this.courseTitle,
      this.courseDescription,
      this.startDate,
      this.endDate,
      this.evaluation,
      this.adminID,
      this.adminName,
      this.departmentID,
      this.departmentName,
      this.sessionID,
      this.sessionDate,
      this.dayOfWeek,
      this.dayOfWeekArabic,
      this.courseDate,
      this.userName,
      this.id,
      this.courseURL,
      this.videoURL});

  coursedetails.fromJson(Map<String, dynamic> json) {
    courseID = json['CourseID'];
    courseTitle = json['CourseTitle'];
    courseDescription = json['CourseDescription'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    evaluation = json['evaluation'];
    adminID = json['AdminID'];
    adminName = json['AdminName'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
    sessionID = json['SessionID'];
    sessionDate = json['SessionDate'];
    dayOfWeek = json['DayOfWeek'];
    dayOfWeekArabic = json['DayOfWeekArabic'];
    courseDate = json['CourseDate'];
    userName = json['UserName'];
    id = json['id'];
    courseURL = json['CourseURL'];
    videoURL = json['VideoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['CourseTitle'] = this.courseTitle;
    data['CourseDescription'] = this.courseDescription;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['evaluation'] = this.evaluation;
    data['AdminID'] = this.adminID;
    data['AdminName'] = this.adminName;
    data['DepartmentID'] = this.departmentID;
    data['DepartmentName'] = this.departmentName;
    data['SessionID'] = this.sessionID;
    data['SessionDate'] = this.sessionDate;
    data['DayOfWeek'] = this.dayOfWeek;
    data['DayOfWeekArabic'] = this.dayOfWeekArabic;
    data['CourseDate'] = this.courseDate;
    data['UserName'] = this.userName;
    data['id'] = this.id;
    data['CourseURL'] = this.courseURL;
    data['VideoURL'] = this.videoURL;
    return data;
  }
}