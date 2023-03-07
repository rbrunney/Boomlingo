import 'dart:convert';
import 'package:boomlingo/pages/lesson/quiz/quiz_page.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class LessonCard extends StatefulWidget {
  final int lessonId;
  final String lessonTitle;
  final String lessonThumbnail;
  final String videoId;
  final int totalExcercise;
  final int totalRewardPoints;
  const LessonCard(
      {super.key,
        this.lessonId = 0,
      this.lessonTitle = 'TITLE',
      this.lessonThumbnail =
          'https://i.pinimg.com/736x/ba/92/7f/ba927ff34cd961ce2c184d47e8ead9f6.jpg',
        this.videoId = '',
      this.totalExcercise = 0,
      this.totalRewardPoints = 0});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  List<Widget> excerciseDots = [];
  List<dynamic> questions = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future<String>? getLessonQuestions = Requests().makeGetRequest("${global_data.awsBaseLink}/question/get");

    return Container(
        padding: const EdgeInsets.all(15),
        child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Image.network(
                                widget.lessonThumbnail,
                                width: 350,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: global_style.textFont,
                                        fontWeight: FontWeight.bold),
                                    widget.lessonTitle),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(Icons.star_border_purple500_rounded),
                                    Text(
                                      style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: global_style.textFont,
                                      fontWeight: FontWeight.bold),
                                      '${widget.totalRewardPoints}'
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Row(
                          children: [
                            FutureBuilder<String>(
                              future: getLessonQuestions,
                              builder: (context, snapshot) {
                                if(snapshot.hasData) {
                                  List<dynamic> response = json.decode(snapshot.data!);

                                  for(var question in response) {
                                    if(question['lesson_id'] == widget.lessonId) {
                                      excerciseDots.add(Container(
                                        width: 12,
                                        height: 12,
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        decoration: const BoxDecoration(
                                          color: Color(global_style.lightBlueAccentColor),
                                          shape: BoxShape.circle,
                                        ),
                                      ));

                                      questions.add(question);
                                    }
                                  }

                                  return Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: global_style.textFont,
                                            fontWeight: FontWeight.bold),
                                        '${excerciseDots.length} exercises'),
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
                            ),
                            const Spacer(),
                            FutureBuilder<String>(
                                future: getLessonQuestions,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    return Container(
                                        margin:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                        child: Row(
                                          children: excerciseDots,
                                        ));
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
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) => QuizPage(
                                        lessonId: widget.lessonId,
                                        videoId: widget.videoId,
                                        lessonTitle: widget.lessonTitle,
                                        questions: questions,
                                      )));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                        color: const Color(
                                            global_style.darkBlueAccentColor),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: const Text('Begin',
                                                style: TextStyle(
                                                    color: Color(global_style
                                                        .whiteAccentColor))))))))
                      ],
                    )),
              ],
            )));
  }
}
