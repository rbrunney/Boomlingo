import 'package:boomlingo/pages/search/definition_card.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: CustomTextField(
            hintText: 'Enter Term...',
            labelText: 'Enter Term',
            prefixIcon: Ionicons.search,
            prefixIconPress: () {
              Navigator.push(
                    context,
                    PageTransition(
                        child: const DefinitionCard(
                          term: 'Ur Mom',
                          definition: 'Ur Mom',
                          example: 'Ur Mom',
                        ),
                        type: PageTransitionType.rightToLeftWithFade));
            },
            textCallBack: (value) {
              print('Hello World');
            },
            textController: searchController));
  }
}
