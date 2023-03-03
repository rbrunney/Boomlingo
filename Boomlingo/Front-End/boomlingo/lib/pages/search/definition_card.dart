import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class DefinitionCard extends StatelessWidget {
  final String term;
  final String definition;
  final String example;
  const DefinitionCard({
    super.key,
    this.term = '',
    this.definition = '',
    this.example = ''
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(global_style.pageBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const ToPrevPage(),
              ),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  child: Column(
                    children: [
                      PageTitle(
                        title: term,
                        alignment: Alignment.center,
                      ),
                      CustomText(
                        text: definition,
                        alignment: Alignment.center,
                      ),
                      CustomText(
                        text: example,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                )
              )
            ],
          )
        ),
      )
    );
  }
}
