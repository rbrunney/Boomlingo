import 'package:boomlingo/pages/lesson/expandable_card/horizontal_card_scroll.dart';
import 'package:boomlingo/pages/lesson/expandable_card/sub_card.dart';
import 'package:boomlingo/pages/lesson/expandable_card/sub_cards/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ExpandableCard extends StatefulWidget {
  final String cardHeader;
  const ExpandableCard({super.key, this.cardHeader = ''});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: SizedBox(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 20),
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    color: isExpanded ? const Color(global_style.darkBlueAccentColor) :const Color(global_style.whiteAccentColor),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 20, top: 10, bottom: 10),
                          child: Row(children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                widget.cardHeader,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: global_style.textFont,
                                    fontWeight: FontWeight.bold,
                                    color: isExpanded ? const Color(global_style.whiteAccentColor) : const Color(global_style.textColor)
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              isExpanded ? Ionicons.md_chevron_up : Ionicons.md_chevron_down,
                              color: isExpanded ? const Color(global_style.whiteAccentColor) : const Color(global_style.textColor)
                            )
                          ])),
                        Visibility(
                          visible: isExpanded,
                          child: HorizontalCardSlider(
                            cards: const [
                              LessonCard(),
                              LessonCard(),
                              LessonCard()
                            ],
                          )
                        )
                      ],
                    )))));
  }
}
