import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';

class DefinitionCard extends StatelessWidget {
  final String term;
  final String definition;
  final String example;
  final String gifLink;
  const DefinitionCard(
      {super.key,
      this.term = '',
      this.definition = '',
      this.example = '',
      this.gifLink = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        gifLink ?? 'https://i.pinimg.com/736x/ba/92/7f/ba927ff34cd961ce2c184d47e8ead9f6.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),  
                  PageTitle(
                    title: term,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: 'Definition',
                    alignment: Alignment.center,
                    fontSize: 20,
                  ),
                  CustomText(
                    text: definition,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: 'Example',
                    alignment: Alignment.center,
                    fontSize: 20,
                    topMargin: 10,
                  ),
                  CustomText(
                    text: example,
                    alignment: Alignment.center,
                  )
                ],
              ),
            )));
  }
}
