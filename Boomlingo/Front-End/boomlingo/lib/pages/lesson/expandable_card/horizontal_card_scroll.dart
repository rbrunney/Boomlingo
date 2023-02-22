import 'package:boomlingo/pages/lesson/expandable_card/sub_card.dart';
import 'package:flutter/material.dart';

class HorizontalCardSlider extends StatefulWidget {
  List<Widget> cards;
  HorizontalCardSlider({super.key, this.cards = const []});

  @override
  State<HorizontalCardSlider> createState() => _HorizontalCardSliderState();
}

class _HorizontalCardSliderState extends State<HorizontalCardSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: PageView.builder(
            itemCount: widget.cards.length,
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              return widget.cards[pagePosition];
            }));
  }
}
