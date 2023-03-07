import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class Alert extends StatelessWidget {
  String title;
  String message;
  String buttonMessage;
  double height;
  double width;
  bool popExtra;
  Alert({
    Key? key,
    this.title = '',
    this.message = '',
    this.buttonMessage = '',
    this.height = 0,
    this.width = 0,
    this.popExtra = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: AlertDialog(
          title: Text(title, style: TextStyle(fontFamily: global_style.textFont)),
          content: Text(message, style: TextStyle(fontFamily: global_style.textFont)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if(popExtra) {
                  Navigator.pop(context);
                }
              },
              child: Text(buttonMessage, style: TextStyle(fontFamily: global_style.textFont)),
            ),
          ],
        )
    );
  }
}
