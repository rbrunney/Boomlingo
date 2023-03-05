import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

class AccountHeader extends StatefulWidget {
  const AccountHeader({Key? key}) : super(key: key);

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    print('Test');
    return Container(
      margin: const EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 65),
      child: Row(children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: global_data.userData['photoUrl'] != ""
              ? NetworkImage(global_data.userData['photoUrl'])
              : null,
          child: global_data.userData['photoUrl'] != ""
              ? null
              : const Icon(
                  Icons.account_circle_outlined,
                  size: 60,
                ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: global_data.userData['name'],
                  fontSize: 25,
                  isBold: true,
                ),
                CustomText(
                    text: "Member Since: ${global_data.userData['joinDate']}",
                    fontSize: 14,
                    color: Colors.grey)
              ],
            ))
      ]),
    );
  }
}
