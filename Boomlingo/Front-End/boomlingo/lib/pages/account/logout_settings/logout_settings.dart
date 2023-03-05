import 'package:boomlingo/pages/account/settings_tab.dart';
import 'package:boomlingo/pages/landing/landing_page.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

class LogoutSettings extends StatefulWidget {
  const LogoutSettings({Key? key}) : super(key: key);

  @override
  State<LogoutSettings> createState() => _LogoutSettingsState();
}

class _LogoutSettingsState extends State<LogoutSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const PageTitle(
              title: "Logout",
              fontSize: 20,
            ),
          ),
          SettingsTab(
            iconData: MaterialCommunityIcons.exit_run,
            name: "Log Out",
            onTap: () {
              global_data.currentLoginType = global_data.LoginType.none;
              global_data.userData = {"name": "", "email": "", "photoUrl": ""};

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                  (Route<dynamic> route) => false);
            },
          )
        ]));
  }
}
