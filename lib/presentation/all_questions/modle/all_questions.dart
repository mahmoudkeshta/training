class questions{
  String? questionId;
  String? questionText;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correctOption;
  String? examId;
  String? examTitle;
  String? examDate;
  String? courseId;
  String? courseName;

 questions (
      {this.questionId,
      this.questionText,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.correctOption,
      this.examId,
      this.examTitle,
      this.examDate,
      this.courseId,
      this.courseName});

  questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionText = json['question_text'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correctOption = json['correct_option'];
    examId = json['exam_id'];
    examTitle = json['exam_title'];
    examDate = json['exam_date'];
    courseId = json['course_id'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_text'] = this.questionText;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['option4'] = this.option4;
    data['correct_option'] = this.correctOption;
    data['exam_id'] = this.examId;
    data['exam_title'] = this.examTitle;
    data['exam_date'] = this.examDate;
    data['course_id'] = this.courseId;
    data['course_name'] = this.courseName;
    return data;
  }
}