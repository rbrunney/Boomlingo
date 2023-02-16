import 'package:flutter/material.dart';

class PageImage extends StatelessWidget {
  final String assetImg;
  final double marginTop;
  const PageImage({
    Key? key,
    this.assetImg = '',
    this.marginTop = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginTop),
      child: Image(
        image: AssetImage(assetImg),
        width: 250,
        height: 250,
      ), // Display Logo
    );
  }
}