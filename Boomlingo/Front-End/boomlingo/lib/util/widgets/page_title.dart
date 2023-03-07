import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class PageTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final double leftMargin;
  final double bottomMargin;
  final Alignment alignment;
  const PageTitle(
      {Key? key,
      this.title = '',
      this.fontSize = 40,
      this.alignment = Alignment.centerLeft,
      this.leftMargin = 15,
      this.bottomMargin = 15
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        margin: EdgeInsets.only(left: leftMargin, bottom: bottomMargin),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: global_style.textFont,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ));
  }
}
