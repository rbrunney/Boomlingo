import 'dart:convert';

import 'package:boomlingo/pages/lesson/lesson_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseCard extends StatefulWidget {
  CourseCard(
      {Key? key,
      this.imageUrl = "",
      this.courseName = "",
      this.courseID = 0,
      this.lessons = const []})
      : super(key: key);

  String? imageUrl;
  final String courseName;
  final int courseID;
  final List<dynamic> lessons;
  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350, maxHeight: 125),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LessonPage()));
          },
          child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  if (widget.imageUrl != "")
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          child: Image.network(
                            widget.imageUrl!,
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        )),
                  if (widget.imageUrl == "")
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Image(
                            image: AssetImage("assets/images/icon.png"),
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        )),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                        child: Text(
                          widget.courseName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 15),
                          child: Center(
                            child: Text(
                              "Includes ${widget.lessons.length} memes",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              )),
        ));
  }
}
