import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class LessonCard extends StatefulWidget {
  final String lessonTitle;
  final String lessonThumbnail;
  final int totalExcercise;
  final int totalRewardPoints;
  const LessonCard(
      {super.key,
      this.lessonTitle = 'TITLE',
      this.lessonThumbnail =
          'https://i.pinimg.com/736x/ba/92/7f/ba927ff34cd961ce2c184d47e8ead9f6.jpg',
      this.totalExcercise = 0,
      this.totalRewardPoints = 0});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
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
                                Text(
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: global_style.textFont,
                                        fontWeight: FontWeight.bold),
                                    '${widget.totalRewardPoints}'),
                              ],
                            )),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: global_style.textFont,
                                  fontWeight: FontWeight.bold),
                              '${widget.totalExcercise} exercises'),
                        ),
                        InkWell(
                          onTap: () {}, 
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Card(
                                color: Color(global_style.darkBlueAccentColor),
                                child: Text('Text', style: TextStyle(color: Color(global_style.whiteAccentColor)))
                              )
                            )
                          )
                        )
                      ],
                    )),
              ],
            )));
  }
}