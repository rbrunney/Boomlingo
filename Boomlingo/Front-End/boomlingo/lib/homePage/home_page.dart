import 'package:boomlingo/util/nav_widget.dart';
import 'package:boomlingo/util/widgets/achievement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

import '../util/widgets/page_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: const Text(
                              "Alex",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
                            navName: "Lessons",
                            navScore: 13,
                            navIcon: FontAwesome.bookmark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    height: 600,
                    child: Card(
                      color: const Color(global_style.pageBackgroundColor),
                      margin: const EdgeInsets.only(top: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      elevation: 2,
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40, right: 120),
                          child: const Text(
                            "Let's begin studying!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
