import 'dart:convert';
import 'package:flutter/material.dart';
import 'definition_card.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/custom_text.dart';

class SearchResult extends StatefulWidget {
  final String searchTerm;
  SearchResult({super.key, required this.searchTerm});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  Map<String, dynamic> searchResult = {
    "term": "",
    "definition": "",
    "example": ""
  };

  @override
  Widget build(BuildContext context) {
    Future<String>? searchRequest = Requests().makePostRequest(
        "${global_data.awsWebScraperLink}/definition_scrape",
        {"search_term": widget.searchTerm});

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
                child: FutureBuilder<String>(
                    future: searchRequest,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        searchResult = json.decode(snapshot.data!);

                        if (searchResult.containsKey("message")) {
                          return Column(children: [
                            const ToPrevPage(),
                            const PageTitle(
                                title: 'Search Result',
                                alignment: Alignment.center,
                                leftMargin: 0),
                            CustomText(text: 'Definiton Not Avaiable', fontSize: 20)
                          ]);
                        }
                        return Column(
                          children: [
                            const ToPrevPage(),
                            const PageTitle(
                                title: 'Search Result',
                                alignment: Alignment.center,
                                leftMargin: 0),
                            DefinitionCard(
                                term: searchResult['term'],
                                definition: searchResult['definition'],
                                example: searchResult['example'],
                                gifLink: searchResult['gif_link']  
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
                    }))));
  }
}
