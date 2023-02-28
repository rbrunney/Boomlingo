import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class CustomDivider extends StatelessWidget {
  final double thickness;
  const CustomDivider({Key? key, this.thickness = 1.5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: const Color(global_style.lightBlueAccentColor),
    );
  }
}
