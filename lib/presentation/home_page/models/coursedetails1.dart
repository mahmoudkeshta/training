class coursedetails2 {
  String? courseID;
  String? courseTitle;
  String? courseDescription;
  String? startDate;
  String? endDate;
  String? evaluation;
  String? adminID;
  String? adminName;
  String? departmentID;
  String? departmentName;
  String? sessionID;
  String? sessionDate;
  String? dayOfWeek;
  String? dayOfWeekArabic;
  String? courseDate;
  //String? userName;
  //int? id;
  String? courseURL;
 // String? videoURL;
  //int? idusers;
//int? favorite;


  coursedetails2(
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
     // this.userName,
     //// this.id,
      this.courseURL,
     // this.videoURL,
    //  this.idusers,
    // this.favorite
      });

  coursedetails2.fromJson(Map<String, dynamic> json) {
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
   // userName = json['UserName'];
  //  id = json['id'];
    courseURL = json['CourseURL'];
   // videoURL = json['VideoURL'];
   // idusers = json['idusers'];
   //favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CourseID'] = courseID;
    data['CourseTitle'] = courseTitle;
    data['CourseDescription'] = courseDescription;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['evaluation'] = evaluation;
    data['AdminID'] = adminID;
    data['AdminName'] = adminName;
    data['DepartmentID'] = departmentID;
    data['DepartmentName'] = departmentName;
    data['SessionID'] = sessionID;
    data['SessionDate'] = sessionDate;
    data['DayOfWeek'] = dayOfWeek;
    data['DayOfWeekArabic'] = dayOfWeekArabic;
    data['CourseDate'] = courseDate;
   // data['UserName'] = userName;
   // data['id'] = this.id;
    data['CourseURL'] = courseURL;
   // data['VideoURL'] = videoURL;
   // data['idusers'] = this.idusers;
   // data['favorite'] = favorite;
    return data;
  }
}