import 'package:boomlingo/pages/account/settings_tab.dart';
import 'package:boomlingo/pages/account/support_settings/contact_page.dart';
import 'package:boomlingo/pages/account/support_settings/privacy_policy_text.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:boomlingo/pages/landing/landing_page.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

import '../../util/widgets/custom_text.dart';
import '../login/forgot_password_page.dart';
import 'account_settings/account_info_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
                child: Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 65, left: 20, right: 35, bottom: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(
              Icons.account_circle_outlined,
              size: 60,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: global_data.userData['name'],
                      fontSize: 25,
                    ),
                    CustomText(
                        text: "Member Since: ${global_data.userData['joinDate']}",
                        fontSize: 14,
                        color: Colors.grey)
                  ],
                ))
          ]),
        ),
        Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20, left: 15),
                  child: const PageTitle(
                    title: "Account",
                    fontSize: 20,
                  ),
                ),
                SettingsTab(
                  iconData: Icons.account_circle_outlined,
                  name: "Account Info",
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const AccountInfoPage(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                ),
                SettingsTab(
                  iconData: Icons.lock_outline,
                  name: "Password",
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const ForgotPasswordPage(
                              title: "Update",
                            ),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20, left: 15),
                  child: const PageTitle(
                    title: "Help & Support",
                    fontSize: 20,
                  ),
                ),
                SettingsTab(
                  iconData: Icons.email_outlined,
                  name: "Contact",
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const ContactPage(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                ),
                SettingsTab(
                  iconData: Icons.notes_outlined,
                  name: "Privacy Policy",
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const PrivacyPolicy(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )),
        Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 15),
                child: const PageTitle(
                  title: "Logout",
                  fontSize: 20,
                ),
              ),
              SettingsTab(
                iconData: MaterialCommunityIcons.exit_run,
                name: "Log Out",
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                      (Route<dynamic> route) => false);
                },
              )
            ]))
      ],
    ))));
  }
}
