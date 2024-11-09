class Mycrt {
  String? idCart;
  String? cartUser;
  String? cartItem;
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
  String? price;

  Mycrt(
      {this.idCart,
      this.cartUser,
      this.cartItem,
      this.courseID,
      this.title,
      this.description,
      this.locationID,
      this.adminID,
      this.startDate,
      this.endDate,
      this.imageCourese,
      this.evaluation,
      this.id,
      this.price
      });

  Mycrt.fromJson(Map<String, dynamic> json) {
    idCart = json['id_cart'];
    cartUser = json['cart_user'];
    cartItem = json['cart_item'];
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
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_cart'] = this.idCart;
    data['cart_user'] = this.cartUser;
    data['cart_item'] = this.cartItem;
    data['CourseID'] = this.courseID;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['LocationID'] = this.locationID;
    data['AdminID'] = this.adminID;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Image_courese'] = this.imageCourese;
    data['evaluation'] = this.evaluation;
    data['id'] = this.id;
    data['price'] = this.id;
    return data;
  }
}