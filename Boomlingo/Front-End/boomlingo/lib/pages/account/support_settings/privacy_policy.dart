import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PolicyText extends StatelessWidget {
  final String text;
  const PolicyText({
    Key? key,
    this.text = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      topMargin: 10,
      bottomMargin: 10,
      leftMargin: 30,
      rightMargin: 30,
      text: text
    );
  }
}