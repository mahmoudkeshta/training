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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MediaID'] = mediaID;
    data['CourseID'] = courseID;
    data['MediaType'] = mediaType;
    data['MediaURL'] = mediaURL;
    data['Description'] = description;
    return data;
  }
}
