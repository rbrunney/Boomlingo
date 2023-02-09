import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

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
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                        const Spacer(),
                        Text(
                            'What The Dog Doin',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: global_style.textFont
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            color: const Color(global_style.darkBlueAccentColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.checklist_rounded, color: Color(global_style.whiteAccentColor),),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            )
          )
    );
  }
}
