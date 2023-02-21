import 'package:flutter/material.dart';

class LessonCard extends StatefulWidget {
  final String lessonTitle;
  final String lessonThumbnail;
  final int totalExcercise;
  final int totalRewardPoints;
  const LessonCard({
    super.key,
    this.lessonTitle = '',
    this.lessonThumbnail = 'https://i.pinimg.com/736x/ba/92/7f/ba927ff34cd961ce2c184d47e8ead9f6.jpg',
    this.totalExcercise = 0,
    this.totalRewardPoints = 0
  });

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    widget.lessonThumbnail,
                    width: 350,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          )
        );
  }
}
