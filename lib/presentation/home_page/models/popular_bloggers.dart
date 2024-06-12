class popular_bloggers {
  int? id;
  String? bloggerName;
  String? title;
  String? paragraphText;
  String? imageUrl;

  popular_bloggers(
      {this.id,
      this.bloggerName,
      this.title,
      this.paragraphText,
      this.imageUrl});

  popular_bloggers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloggerName = json['blogger_name'];
    title = json['title'];
    paragraphText = json['paragraph_text'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['blogger_name'] = this.bloggerName;
    data['title'] = this.title;
    data['paragraph_text'] = this.paragraphText;
    data['image_url'] = this.imageUrl;
    return data;
  }
}