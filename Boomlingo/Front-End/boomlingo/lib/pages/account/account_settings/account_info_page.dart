import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ToPrevPage(),
              const PageTitle(
                alignment: Alignment.center,
                title: "Account Info",
              ),
              CustomText(
                text: "rbrunney",
              )
            ],
          ),
        ),
      )
    );
  }
}