import 'package:boomlingo/homePage/home_page.dart';
import 'package:boomlingo/pages/account/account_page.dart';
import 'package:boomlingo/pages/lesson/lesson_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

import 'nav_widget.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({Key? key}) : super(key: key);

  @override
  _PageNavigation createState() => _PageNavigation();
}

class _PageNavigation extends State<PageNavigation> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
              allowImplicitScrolling: true,
              controller: pageController,
              onPageChanged: (newPage) {
                setState(() {
                  _selectedIndex = newPage;
                });
              },
              children: const [HomePage(), LessonPage(), LessonPage(), AccountPage()],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  iconSize: 20,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded),
                        activeIcon: NavWidget(
                          navIcon: Icons.home_rounded,
                          navName: "Home",
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      activeIcon: NavWidget(
                          navIcon: Icons.search,
                          navName: "Search",
                        ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.carrot), label: 'Meals'),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: 'Account',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor:
                      const Color(global_style.darkBlueAccentColor),
                  unselectedItemColor:
                      const Color(global_style.lightBlueAccentColor),
                  onTap: onTapped,
                ),
              ),
            )));
  }
}
