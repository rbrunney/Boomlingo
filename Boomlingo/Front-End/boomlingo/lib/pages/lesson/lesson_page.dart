import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/requests/requests.dart';

import 'expandable_card/sub_cards/lesson_card.dart';
import 'lesson_header.dart';

class LessonPage extends StatefulWidget {
  final String courseName;
  final int courseId;
  const LessonPage({Key? key, this.courseName = '', this.courseId = 0}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  Future<String>? getLessonRequest = Requests().makeGetRequest("${global_data.awsBaseLink}/lesson/get");
  List<LessonCard> lessonCards = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: [
                LessonHeader(headerText: widget.courseName),
                FutureBuilder<String>(
                  future: getLessonRequest,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      List<dynamic> lessons = json.decode(snapshot.data!);
                      lessons.forEach((lesson) {
                        if(lesson['course_id'] == widget.courseId) {
                          print(lesson);
                          lessonCards.add(
                              LessonCard(
                                lessonId: lesson['lesson_id'],
                            videoId: lesson['video_id'],
                            totalRewardPoints: lesson['total_points'],
                            lessonTitle: lesson['lesson_name'],
                            lessonThumbnail: lesson['thumbnail'],
                          ));
                        }
                      });

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lessonCards.length,
                              itemBuilder: (BuildContext context, int index) {
                                return lessonCards[index];
                              },
                            )
                          ],
                        )
                      );
                    }
                    return Center(
                        heightFactor: 20,
                        child: Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: Color(global_style.lightBlueAccentColor),
                          ),
                        ));
                  }
                )
              ],
            ),
          )));
  }
}
