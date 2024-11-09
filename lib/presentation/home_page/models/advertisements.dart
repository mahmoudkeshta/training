class advertisements {
  int? id;
  String? title;
  String? description;
  String? startDate;
  String? imageUrl;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  advertisements(
      {this.id,
      this.title,
      this.description,
      this.startDate,
      this.imageUrl,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  advertisements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    imageUrl = json['image_url'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['start_date'] = startDate;
    data['image_url'] = imageUrl;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}