import 'package:flutter/material.dart';

class SubCard extends StatefulWidget {
  const SubCard({super.key});

  @override
  State<SubCard> createState() => _SubCardState();
}

class _SubCardState extends State<SubCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: const Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text('What the nut')
          )
        );
  }
}
