class coursemedia {
  int? mediaID;
  int? courseID;
  String? mediaType;
  String? mediaURL;
  String? description;

  coursemedia(
      {this.mediaID,
      this.courseID,
      this.mediaType,
      this.mediaURL,
      this.description});

  coursemedia.fromJson(Map<String, dynamic> json) {
    mediaID = json['MediaID'];
    courseID = json['CourseID'];
    mediaType = json['MediaType'];
    mediaURL = json['MediaURL'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MediaID'] = this.mediaID;
    data['CourseID'] = this.courseID;
    data['MediaType'] = this.mediaType;
    data['MediaURL'] = this.mediaURL;
    data['Description'] = this.description;
    return data;
  }
}
