class course {
  int? courseID;
  String? title;
  String? description;
  int? locationID;
  int? adminID;
  String? startDate;
  String? endDate;
  String? evaluation;
  String? imageCourese;

  course(
      {this.courseID,
      this.title,
      this.description,
      this.locationID,
      this.adminID,
      this.startDate,
      this.endDate,
      this.imageCourese,
      this.evaluation
      });

  course.fromJson(Map<String, dynamic> json) {
    courseID = json['CourseID'];
    title = json['Title'];
    description = json['Description'];
    locationID = json['LocationID'];
    adminID = json['AdminID'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    imageCourese = json['Image_courese'];
    evaluation = json['evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['LocationID'] = this.locationID;
    data['AdminID'] = this.adminID;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Image_courese'] = this.imageCourese;
    data['evaluation'] = this.evaluation;
    return data;
  }
}