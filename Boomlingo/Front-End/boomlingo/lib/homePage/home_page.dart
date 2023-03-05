import 'package:boomlingo/util/nav_widget.dart';
import 'package:boomlingo/util/widgets/achievement_widget.dart';
import 'package:boomlingo/util/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

import '../util/widgets/page_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CourseCard> courseCards = [
    CourseCard(
      courseID: 1,
      courseName: "2016",
      lessons: const ["stuff", "more stuff", "yessirrr"],
    ),
    CourseCard(
      courseID: 2,
      courseName: "2017",
      lessons: const ["stuff"],
    ),
    CourseCard(
      courseID: 3,
      courseName: "2018",
      lessons: const ["stuff"],
    ),
    CourseCard(
      courseID: 4,
      courseName: "2019",
      lessons: const ["stuff"],
    ),
    CourseCard(
      courseID: 4,
      courseName: "2020",
      lessons: const ["more stuff", "yessirrr"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/CqBO6J.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: CircleAvatar(
                        radius: 30,
                        backgroundImage: global_data.userData['photoUrl'] != ""
                            ? NetworkImage(global_data.userData['photoUrl'])
                            : null,
                        child: global_data.userData['photoUrl'] != ""
                            ? null
                            : const Icon(
                                Icons.account_circle_outlined,
                                size: 60,
                              ),
                        )
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 5, top: 5, right: 30),
                            child: Text(
                              global_data.userData['name'],
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const NavWidget(
                              navName: "English", navIcon: FontAwesome.flag)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: const AchievementWidget(
                            navName: "Your score",
                            navScore: 1235,
                            navIcon: Icons.star_border_purple500_rounded),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: const AchievementWidget(
                            navName: "Courses",
                            navScore: 13,
                            navIcon: FontAwesome.bookmark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 450,
                    height: 600,
                    child: Card(
                        color: const Color(global_style.pageBackgroundColor),
                        margin: const EdgeInsets.only(top: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        elevation: 2,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 40, right: 120, bottom: 10),
                              child: const Text(
                                "Let's begin studying!",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: courseCards.length,
                              itemBuilder: (context, index) {
                                return courseCards[index];
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            )
                          ]),
                        )),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
