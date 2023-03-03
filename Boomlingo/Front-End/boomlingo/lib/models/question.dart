class Question {
  int? id;
  String? questionName;
  int? correctAnswer;
  int? lessonId;

  Question({this.id, this.questionName, this.correctAnswer, this.lessonId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionName = json['question_name'];
    correctAnswer = json['correct_answer'];
    lessonId = json['lesson_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_name'] = this.questionName;
    data['correct_answer'] = this.correctAnswer;
    data['lesson_id'] = this.lessonId;
    return data;
  }
}