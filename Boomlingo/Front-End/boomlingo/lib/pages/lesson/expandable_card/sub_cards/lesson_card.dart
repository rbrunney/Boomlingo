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
  List<Widget> excerciseDots = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.totalExcercise; i++) {
      excerciseDots.add(Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: const BoxDecoration(
          color: Color(global_style.lightBlueAccentColor),
          shape: BoxShape.circle,
        ),
      ));
    }
  }

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
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: global_style.textFont,
                                      fontWeight: FontWeight.bold),
                                  '${widget.totalExcercise} exercises'),
                            ),
                            const Spacer(),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: excerciseDots,
                                ))
                          ],
                        ),
                        InkWell(
                            onTap: () {},
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
