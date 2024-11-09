 class department {
  int? departmentID;
  String? name;
    String?image_department;

  department({this.departmentID, this.name,this.image_department});

  department.fromJson(Map<String, dynamic> json) {
    departmentID = json['DepartmentID'];
    name = json['Name'];
    image_department = json['image_department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DepartmentID'] = departmentID;
    data['Name'] = name;
    data['image_department'] = image_department;
    return data;
  }
}
