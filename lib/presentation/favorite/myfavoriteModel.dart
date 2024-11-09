

class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUser;
  String? favoriteItem;
  String? courseID;
  String? title;
  String? description;
  String? locationID;
  String? adminID;
  String? startDate;
  String? endDate;
  String? imageCourese;
  String? evaluation;
  String? id;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUser,
      this.favoriteItem,
      this.courseID,
      this.title,
      this.description,
      this.locationID,
      this.adminID,
      this.startDate,
      this.endDate,
      this.imageCourese,
      this.evaluation,
      this.id});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUser = json['favorite_user'];
    favoriteItem = json['favorite_item'];
    courseID = json['CourseID'];
    title = json['Title'];
    description = json['Description'];
    locationID = json['LocationID'];
    adminID = json['AdminID'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    imageCourese = json['Image_courese'];
    evaluation = json['evaluation'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_user'] = favoriteUser;
    data['favorite_item'] = favoriteItem;
    data['CourseID'] = courseID;
    data['Title'] = title;
    data['Description'] = description;
    data['LocationID'] = locationID;
    data['AdminID'] = adminID;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['Image_courese'] = imageCourese;
    data['evaluation'] = evaluation;
    data['id'] = id;
    return data;
  }
}