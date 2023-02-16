import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class NavWidget extends StatelessWidget {
  const NavWidget({super.key, required this.navName, required this.navIcon});

  final String navName;
  final IconData navIcon;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 105,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Icon(navIcon),
          ),
          Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(navName),
          )
        ]),
      ),
    ));
  }
}
