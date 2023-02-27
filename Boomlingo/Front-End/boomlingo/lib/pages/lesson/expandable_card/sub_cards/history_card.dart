import 'package:boomlingo/util/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class HistoryCard extends StatefulWidget {
  final String historyTitle;
  final String historyDescription;
  const HistoryCard(
      {super.key, this.historyTitle = '', this.historyDescription = ''});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: global_style.textFont,
                    fontWeight: FontWeight.bold),
                widget.historyTitle),
            ),
            const CustomDivider(thickness: 3),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: global_style.textFont,
                    fontWeight: FontWeight.bold),
                widget.historyDescription),
            ),
          ])));
  }
}
