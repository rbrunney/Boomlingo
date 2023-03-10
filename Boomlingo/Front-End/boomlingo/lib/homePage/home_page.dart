import 'dart:convert';

import 'package:boomlingo/models/course.dart';
import 'package:boomlingo/util/nav_widget.dart';
import 'package:boomlingo/util/widgets/achievement_widget.dart';
import 'package:boomlingo/util/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

import '../util/widgets/page_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Future<String>? getCourseRequest = Requests().makeGetRequest("${global_data.awsBaseLink}/course/get");
    return Scaffold(
        body: Container(
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
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          color: const Color(global_style.pageBackgroundColor),
                          margin: const EdgeInsets.only(top: 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                          ),
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 25, right: 120, bottom: 10),
                                child: const Text(
                                  "Let's begin studying!",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child:
                                FutureBuilder<String>(
                                    future: getCourseRequest,
                                    builder: (context, snapshot) {
                                      if(snapshot.hasData) {

                                        List<dynamic> courses = json.decode(snapshot.data!);

                                        print(courses);

                                        return SingleChildScrollView(
                                          child: Column(
                                              children: [
                                                ListView.separated(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: courses.length,
                                                  itemBuilder: (context, index) {
                                                    try {
                                                      return CourseCard(
                                                        courseID: courses[index]['course_id'],
                                                        courseName: courses[index]['course_name'],
                                                      );
                                                    } catch(exception) {}
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context, int index) =>
                                                  const Divider(),
                                                )
                                              ]
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
                              )
                            ],
                          )
                      ),
                    )
                  )
                ],
              ),
            ],
          ),
    ));
  }
}
