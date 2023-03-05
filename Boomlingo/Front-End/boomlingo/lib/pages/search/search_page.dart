import 'dart:convert';
import 'package:boomlingo/pages/search/definition_card.dart';
import 'package:boomlingo/pages/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

import 'package:boomlingo/util/widgets/page_title.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map<String, dynamic> wordOfDay = {
    "term": "",
    "definition": "",
    "example": ""
  };

  @override
  Widget build(BuildContext context) {
    Future<String>? searchRequest = Requests().makeGetRequest(
        "${global_data.awsWebScraperLink}/word_of_day");

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(global_style.pageBackgroundColor),
      body: SingleChildScrollView(
          child: FutureBuilder<String>(
              future: searchRequest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  wordOfDay = json.decode(snapshot.data!);
                  return Column(
                    children: [
                      const SearchBar(),
                      const PageTitle(
                          title: 'Word of the Day',
                          alignment: Alignment.center,
                          leftMargin: 0),
                      DefinitionCard(
                          term: wordOfDay['term'],
                          definition: wordOfDay['definition'],
                          example: wordOfDay['example'],
                          gifLink: wordOfDay['gif_link']  
                          ),
                    ],
                  );
                }

                return Center(
                    heightFactor: 20,
                    child: Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Color(global_style.lightBlueAccentColor),
                      ),
                    ));
              })),
    ));
  }
}
