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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blogger_name'] = bloggerName;
    data['title'] = title;
    data['paragraph_text'] = paragraphText;
    data['image_url'] = imageUrl;
    return data;
  }
}