import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:boomlingo/pages/landing/landing_button.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:path_provider/path_provider.dart';

import '../../../../util/widgets/alert.dart';

class QuestionCard extends StatefulWidget {
  final int lessonId;
  final String question;
  final String correctAnswerId;
  const QuestionCard({Key? key, this.lessonId = 0, this.question = '', this.correctAnswerId = ''}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  Future<String> _read() async {
    String text = '';
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      print(directory.path);
      final File file = File('${directory.path}/completed_lesson.txt');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }

  Future<String> _write(String textToWrite) async {
    String text = '';
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/completed_lessons.txt');
      await file.writeAsString(textToWrite);
    } catch (e) {
      print("Couldn't write file");
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    Future<String>? getQuestionRequest = Requests().makeGetRequest("${global_data.awsBaseLink}/answer/get");
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: PageTitle(title: widget.question, fontSize: 20, alignment: Alignment.center, leftMargin: 0,),
          ),
          FutureBuilder<String>(
              future: getQuestionRequest,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  List<dynamic> response = json.decode(snapshot.data!);
                  List<dynamic> answerList = [];

                  dynamic correctAnswer;

                  for(var answer in response) {
                    if(answer['id'].toString() == widget.correctAnswerId) {
                      correctAnswer = answer;
                      answerList.add(correctAnswer);
                    }
                  }

                  for(int i=0; i < 2; i++) {
                    var randomAnswer = response[Random().nextInt(response.length)];
                    while (randomAnswer == correctAnswer) {
                      randomAnswer = response[Random().nextInt(response.length)];
                    }
                    answerList.add(randomAnswer);
                  }

                  answerList.shuffle();

                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: answerList.length,
                      itemBuilder: (context, index) {
                        try {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: LandingButton(
                                text: answerList[index]['answer'],
                                hasBorder: true,
                                onTap: () async {
                                  if (answerList[index]['answer'] == correctAnswer['answer']) {

                                    String completedLesson = await _read();

                                    if(completedLesson == '') {
                                      Map<String, dynamic> completedLessons = {
                                        "${widget.lessonId}" : [
                                          answerList[index]
                                        ]
                                      };

                                      await _write(completedLessons.toString());
                                    } else {
                                      Map<String, dynamic> valueMap = json.decode(completedLesson);
                                      valueMap['${widget.lessonId}'].add(answerList[index]);
                                      await _write(valueMap.toString());
                                    }

                                    await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Alert(
                                            title: "Correct",
                                            message: "Good Job that was right!",
                                            buttonMessage: "Continue!",
                                            width: 50,
                                          );
                                        });
                                  } else {
                                    await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Alert(
                                            title: "Wrong",
                                            message: "Be Built Different Try Again!",
                                            buttonMessage: "Continue!",
                                            width: 50,
                                          );
                                        });
                                  }
                                }
                            )
                          );
                        } catch(exception) {}
                        return null;
                      },
                      separatorBuilder:
                          (BuildContext context, int index) =>
                      const Divider()
                  );
                }

                return Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Color(global_style.lightBlueAccentColor),
                      ),
                    );
              })
        ],
      )
    );
  }
}
