class grades {
  String? studentId;
  String? examId;
  String? score;
  String? resultExamDate;
  String? examTitle;
  String? examDate;
  String? title;
  String? adminID;
  String? imageCourese;
  String? examScheduleDate;

  grades(
      {this.studentId,
      this.examId,
      this.score,
      this.resultExamDate,
      this.examTitle,
      this.examDate,
      this.title,
      this.adminID,
      this.imageCourese,
      this.examScheduleDate});

  grades.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    examId = json['exam_id'];
    score = json['score'];
    resultExamDate = json['result_exam_date'];
    examTitle = json['exam_title'];
    examDate = json['exam_date'];
    title = json['Title'];
    adminID = json['AdminID'];
    imageCourese = json['Image_courese'];
    examScheduleDate = json['exam_schedule_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['exam_id'] = this.examId;
    data['score'] = this.score;
    data['result_exam_date'] = this.resultExamDate;
    data['exam_title'] = this.examTitle;
    data['exam_date'] = this.examDate;
    data['Title'] = this.title;
    data['AdminID'] = this.adminID;
    data['Image_courese'] = this.imageCourese;
    data['exam_schedule_date'] = this.examScheduleDate;
    return data;
  }
}