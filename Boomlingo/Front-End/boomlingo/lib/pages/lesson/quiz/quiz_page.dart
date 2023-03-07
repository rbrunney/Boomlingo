import 'package:boomlingo/pages/lesson/expandable_card/horizontal_card_scroll.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart'as global_style;

import '../expandable_card/sub_cards/question_card.dart';
import '../lesson_header.dart';
import '../video_player.dart';

class QuizPage extends StatefulWidget {
  final String lessonTitle;
  final String videoId;
  final int lessonId;
  final List<dynamic> questions;
  const QuizPage({Key? key, this.lessonTitle = '', this.videoId = '', this.lessonId = 0, required this.questions}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<QuestionCard> questionCards = [];

  @override
  void initState() {
    super.initState();

    for(var question in widget.questions) {
      questionCards.add(
        QuestionCard(
          lessonId: question['lesson_id'],
          question: question['question_name'],
          correctAnswerId: question['correct_answer'],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  LessonHeader(headerText: widget.lessonTitle),
                  VideoPlayer(youtubeVideoId: widget.videoId),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: HorizontalCardSlider(
                      cards: questionCards
                    )
                  )
                ],
              ),
            )));
  }
}
