import 'package:flutter/material.dart';

class AchievementWidget extends StatelessWidget {
  const AchievementWidget(
      {super.key,
      required this.navName,
      required this.navScore,
      required this.navIcon});

  final String navName;
  final int navScore;
  final IconData navIcon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 150,
          ),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Icon(navIcon),
              ),
              Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Text(navScore.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    child: Text(navName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),
                  )
              )],
              )
            ]),
          ),
        ));
  }
}
