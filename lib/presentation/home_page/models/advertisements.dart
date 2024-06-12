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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['image_url'] = this.imageUrl;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}