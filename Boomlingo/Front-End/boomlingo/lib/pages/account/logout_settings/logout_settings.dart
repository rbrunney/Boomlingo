import 'package:boomlingo/pages/account/settings_tab.dart';
import 'package:boomlingo/pages/landing/controllers/boomlingo_login_controller.dart';
import 'package:boomlingo/pages/landing/landing_page.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../landing/controllers/facebook_login_controller.dart';
import '../../landing/controllers/google_login_controller.dart';

class LogoutSettings extends StatefulWidget {
  const LogoutSettings({Key? key}) : super(key: key);

  @override
  State<LogoutSettings> createState() => _LogoutSettingsState();
}

class _LogoutSettingsState extends State<LogoutSettings> {

  final googleController = Get.put(GoogleLoginController());
  final facebookController = Get.put(FacebookLoginController());
  final boomlingoController = Get.put(BoomlingoLoginController());


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

              switch(global_data.currentLoginType) {
                case global_data.LoginType.google:
                  googleController.logout();
                  break;
                case global_data.LoginType.facebook:
                  facebookController.logout();
                  break;
                case global_data.LoginType.boomlingo:
                  boomlingoController.logout();
                  break;
                case global_data.LoginType.none:
                  break;
              }

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
