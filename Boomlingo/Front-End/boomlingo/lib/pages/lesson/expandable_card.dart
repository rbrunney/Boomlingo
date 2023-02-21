import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ExpandableCard extends StatefulWidget {
  final String cardHeader;
  const ExpandableCard({
    super.key,
    this.cardHeader = ''
    });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 20),
            child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 20, top: 10, bottom: 10),
                    child: Row(children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.cardHeader,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: global_style.textFont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Ionicons.md_chevron_down)
                    ])))));
  }
}
