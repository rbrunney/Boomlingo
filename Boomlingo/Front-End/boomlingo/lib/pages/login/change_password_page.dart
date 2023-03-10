import 'package:boomlingo/pages/login/login_page.dart';
import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:boomlingo/util/widgets/page_image.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class ChangePasswordPage extends StatefulWidget {
  final String token;
  const ChangePasswordPage({Key? key, this.token = ''}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  String? get newPassErrorText {
    final text = newPasswordController.text;

    RegExp specialCharacter = RegExp('[^a-z0-9A-Z]');
    RegExp capitalCharacter = RegExp('[A-Z]');
    RegExp numberCharacter = RegExp('[0-9]');

    if (text.length < 8) {
      return 'New Password must contain at least 8 characters!';
    } else if (!specialCharacter.hasMatch(text)) {
      return 'New Password must contain a special character!';
    } else if (!capitalCharacter.hasMatch(text)) {
      return 'New Password must contain a capital character!';
    } else if (!numberCharacter.hasMatch(text)) {
      return 'New Password must contain a number!';
    }

    return null;
  }

  String? get confirmNewPassErrorText {
    final newPassText = newPasswordController.text;
    final confirmText = confirmNewPasswordController.text;

    if (confirmText != newPassText) {
      return 'Confirm Password does not match!';
    }

    return null;
  }

  void onSubmit() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
                child: Column(
      children: [
        const ToPrevPage(),
        const PageImage(assetImg: 'assets/images/icon.png',  marginTop: 55),
        const PageTitle(title: 'Reset Password'),
        CustomTextField(
            textCallBack: (value) {},
            labelText: 'Enter New Password',
            hintText: 'Enter New Password...',
            isObscure: true,
            hasSuffixIcon: true,
            suffixIcon: Icons.visibility_off_outlined,
            pressedSuffixIcon: Icons.visibility_outlined,
            errorText: newPassErrorText,
            prefixIcon: Icons.lock_outline,
            
            prefixIconPress: () {},
            textController: newPasswordController),
        CustomTextField(
            textCallBack: (value) {},
            labelText: 'Confirm New Password',
            hintText: 'Confirm New Password...',
            isObscure: true,
            hasSuffixIcon: true,
            suffixIcon: Icons.visibility_off_outlined,
            pressedSuffixIcon: Icons.visibility_outlined,
            errorText: confirmNewPassErrorText,
            prefixIcon: Icons.lock_outline,
            
            prefixIconPress: () {},
            textController: confirmNewPasswordController),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                    onPressed: newPasswordController.text.isNotEmpty &&
                            confirmNewPasswordController.text.isNotEmpty
                        ? onSubmit
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(global_style.lightBlueAccentColor),
                    ),
                    child: Text(
                      "Change Password",
                      style: TextStyle(fontFamily: global_style.textFont),
                    )))),
      ],
    ))));
  }
}
