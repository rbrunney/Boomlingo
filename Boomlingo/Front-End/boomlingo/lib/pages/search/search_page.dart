import 'package:boomlingo/pages/search/definition_card.dart';
import 'package:boomlingo/pages/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/widgets/page_title.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(global_style.pageBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: const [SearchBar(), PageTitle(title: 'Word of the Day', alignment: Alignment.center, leftMargin: 0)],
        ),
      ),
    ));
  }
}