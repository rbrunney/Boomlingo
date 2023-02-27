import 'package:boomlingo/pages/account/settings_tab.dart';
import 'package:boomlingo/pages/account/support_settings/contact_page.dart';
import 'package:boomlingo/pages/account/support_settings/privacy_policy_text.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SupportSettings extends StatefulWidget {
  const SupportSettings({Key? key}) : super(key: key);

  @override
  State<SupportSettings> createState() => _SupportSettingsState();
}

class _SupportSettingsState extends State<SupportSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:  const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
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
        )
    );
  }
}