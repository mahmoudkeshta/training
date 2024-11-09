class coursedetails {
  int? courseID;
  String? courseTitle;
  String? courseDescription;
  String? startDate;
  String? endDate;
  String? evaluation; // يمكنك تعديل هذا إلى double إذا كانت التقييمات أرقامًا
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
  String? courseURL;
String ?Image_courese;
  String? price;


  coursedetails({
    this.courseID,
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
    this.courseURL,
    this.Image_courese,
    this.price
  });

  coursedetails.fromJson(Map<String, dynamic> json) {
    courseID = int.tryParse(json['CourseID']?.toString() ?? '0');
    courseTitle = json['CourseTitle'];
    courseDescription = json['CourseDescription'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    evaluation = json['evaluation']?.toString(); // يحتمل أن يكون نصًا
    adminID = int.tryParse(json['AdminID']?.toString() ?? '0');
    adminName = json['AdminName'];
    departmentID = int.tryParse(json['DepartmentID']?.toString() ?? '0');
    departmentName = json['DepartmentName'];
    sessionID = int.tryParse(json['SessionID']?.toString() ?? '0');
    sessionDate = json['SessionDate'];
    dayOfWeek = json['DayOfWeek'];
    dayOfWeekArabic = json['DayOfWeekArabic'];
    courseDate = json['CourseDate'];
    userName = json['UserName'];
    courseURL = json['CourseURL'];
    Image_courese = json['Image_courese'];
    price = json['price'];
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
    data['UserName'] = userName;
    data['CourseURL'] = courseURL;
    data['Image_courese'] = Image_courese;
    data['price'] = price;
    return data;
  }
}
