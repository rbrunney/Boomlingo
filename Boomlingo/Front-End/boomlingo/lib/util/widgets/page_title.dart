import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class PageTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Alignment alignment;
  const PageTitle({
    Key? key,
    this.title = '',
    this.fontSize = 40,
    this.alignment = Alignment.centerLeft
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        margin: const EdgeInsets.only(left: 15, bottom: 15),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: global_style.textFont,
              fontSize: fontSize
          ),
        )
    );
  }
}