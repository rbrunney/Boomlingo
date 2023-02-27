import 'package:boomlingo/pages/lesson/expandable_card/expandable_card.dart';
import 'package:boomlingo/pages/lesson/expandable_card/sub_cards/history_card.dart';
import 'package:boomlingo/pages/lesson/expandable_card/sub_cards/lesson_card.dart';
import 'package:boomlingo/pages/lesson/video_player.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'lesson_header.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                LessonHeader(headerText: "What The Dog Doin"),
                VideoPlayer(youtubeVideoId: "gPPxfPThq20"),
                ExpandableCard(cardHeader: "History", subCards: [HistoryCard(historyTitle: "Year Made", historyDescription: "2012",), HistoryCard(historyTitle: "Original Media", historyDescription: "Vine",)]),
                ExpandableCard(cardHeader: "Lessons", subCards: [LessonCard(totalExcercise: 3,), LessonCard(totalExcercise: 5), LessonCard(totalExcercise: 9)]),
                ExpandableCard(cardHeader: "Quiz")
              ],
            ),
          )));
  }
}
