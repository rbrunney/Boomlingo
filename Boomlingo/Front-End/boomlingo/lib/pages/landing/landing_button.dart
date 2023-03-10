import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/widgets/custom_text.dart';

class LandingButton extends StatelessWidget {
  final String text;
  final String prefixImagePath;
  final bool hasBorder;
  final bool hasFillColor;
  final Function()? onTap;
  const LandingButton(
      {super.key,
      this.text = '',
      this.prefixImagePath = '',
      this.hasBorder = false,
      this.hasFillColor = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: hasFillColor ? const Color(global_style.lightBlueAccentColor) : const Color(global_style.pageBackgroundColor),
              border: hasBorder ? Border.all(color: const Color(global_style.lightBlueAccentColor)) : null,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixImagePath != ''
                    ? Image.asset(prefixImagePath, height: 32, width: 32)
                    : const Text(''),
                CustomText(
                  text: text,
                  color: hasFillColor ? const Color(global_style.whiteAccentColor) : const Color(global_style.textColor),
                  fontSize: 16,
                  isBold: true,
                  leftMargin: prefixImagePath != '' ? 10 : 0,
                )
              ],
            ),
          )),
    );
  }
}