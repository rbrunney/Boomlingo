import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class CustomText extends StatefulWidget {
  double topMargin;
  double bottomMargin;
  double leftMargin;
  double rightMargin;
  double fontSize;
  String text;
  Alignment alignment;
  Color color;

  CustomText(
      {Key? key,
      this.topMargin = 0,
      this.bottomMargin = 0,
      this.leftMargin = 0,
      this.rightMargin = 0,
      this.fontSize = 15,
      this.text = '',
      this.color = Colors.white,
      this.alignment = Alignment.center})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: widget.topMargin,
            bottom: widget.bottomMargin,
            left: widget.leftMargin,
            right: widget.rightMargin),
        alignment: widget.alignment,
        child: Text(widget.text,
            style: TextStyle(
                fontFamily: global_style.textFont, fontSize: widget.fontSize)));
  }
}
