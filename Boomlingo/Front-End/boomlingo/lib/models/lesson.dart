class Lesson {
  int? lessonId;
  String? lessonName;
  int? courseId;

  Lesson({this.lessonId, this.lessonName, this.courseId});

  Lesson.fromJson(Map<String, dynamic> json) {
    lessonId = json['lesson_id'];
    lessonName = json['lesson_name'];
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson_id'] = this.lessonId;
    data['lesson_name'] = this.lessonName;
    data['course_id'] = this.courseId;
    return data;
  }
}