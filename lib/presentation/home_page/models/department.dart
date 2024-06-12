 class department {
  int? departmentID;
  String? name;

  department({this.departmentID, this.name});

  department.fromJson(Map<String, dynamic> json) {
    departmentID = json['DepartmentID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DepartmentID'] = this.departmentID;
    data['Name'] = this.name;
    return data;
  }
}
