import 'dart:convert';
import 'package:flutter/material.dart';
import 'definition_card.dart';
import 'package:boomlingo/util/requests/requests.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

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

  Future<Map<String, dynamic>> getDefiniton() async {
    Requests().makePostRequest(
        "${global_data.awsWebScraperLink}/definition_scrape",
        {"search_term": widget.searchTerm}).then((value) {
        searchResult = json.decode(value);
      setState(() {
        
      });
    });

    return searchResult;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
                child: FutureBuilder<Map<String, dynamic>>(
                    future: getDefiniton(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        return Column(
                          children: [
                            const ToPrevPage(),
                            DefinitionCard(
                                term: searchResult['term'],
                                definition: searchResult['definition'],
                                example: searchResult['example'])
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
