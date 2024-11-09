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
  String ?  price;
  String ?  Description_ar;
  String ?  Title_ar;


  //String? DepartmentID;

  course(
      {this.courseID,
      this.title,
      this.description,
      this.locationID,
      this.adminID,
      this.startDate,
      this.endDate,
      this.imageCourese,
      this.evaluation,
      this.price,
      this.Description_ar,
      this.Title_ar,
     // this.DepartmentID
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
    price = json['price'];
    Description_ar = json['Description_ar'];
    Title_ar = json['Title_ar'];
  //  DepartmentID = json['DepartmentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CourseID'] = courseID;
    data['Title'] = title;
    data['Description'] = description;
    data['LocationID'] = locationID;
    data['AdminID'] = adminID;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['Image_courese'] = imageCourese;
    data['evaluation'] = evaluation;
    data['price'] = price;
    data['Description_ar'] = Description_ar;
    data['Title_ar'] = Title_ar;
   // data['DepartmentID'] = this.DepartmentID;
    return data;
  }
}