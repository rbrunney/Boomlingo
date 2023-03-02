import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'representative-card.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage>
    with SingleTickerProviderStateMixin {
  List<Widget> userSearch = [];
  Future<String>? futureSearchInfo;
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          if (!_isActive)
            Text("Search Representative",
                style: Theme.of(context).appBarTheme.titleTextStyle),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 250),
                child: _isActive
                    ? Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: 'Search for something',
                              prefixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    userSearch.clear();
                                  });
                                  userSearch.add(RepresentativeCard(
                                    userId: 1,
                                    username: "Alex Turro",
                                  ));
                                },
                                icon: const Icon(Icons.search),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isActive = false;
                                    });
                                  },
                                  icon: const Icon(Icons.close))),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _isActive = true;
                          });
                        },
                        icon: const Icon(Icons.search)),
              ),
            ),
          ),
        ],
      )),
      body: SingleChildScrollView(
          child: Column(
        children: userSearch,
      )),
    ));
  }

  void showData(filter, value) {
    LinkedHashMap<String, dynamic> data = json.decode(value);
  }
}
