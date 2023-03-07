import 'package:boomlingo/pages/login/verification_code_page.dart';
import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:boomlingo/util/widgets/page_image.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/requests/requests.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  const ForgotPasswordPage({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  String? get emailErrorText {
    final text = emailController.text;
    RegExp emailCheck = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Simple checks to see if empty or doesn't match regex
    if (!emailCheck.hasMatch(text)) {
      return 'Invalid Email!';
    }

    // Return null is string is valid
    return null;
  }

  void onSubmit() {

    Navigator.push(
        context,
        PageTransition(
            child: VerificationCodePage(userEmail: emailController.text),
            type: PageTransitionType.rightToLeftWithFade));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
      child: Column(children: [
        const ToPrevPage(),
        const PageImage(assetImg: 'assets/images/icon.png',  marginTop: 55),
        PageTitle(title: widget.title),
        const PageTitle(title: "Password?"),
        CustomText(
          leftMargin: 15,
          rightMargin: 15,
          topMargin: 10,
          bottomMargin: 10,
          text:
              "Don't worry! We will send you a one time code! Please enter your email.",
          fontSize: 15,
        ),
        CustomTextField(
          textCallBack: (value) {},
          hintText: 'Enter Email...',
          labelText: 'Enter Email',
          prefixIcon: Icons.email_outlined,
          
            prefixIconPress: () {},
          textController: emailController,
          errorText: emailErrorText,
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                    onPressed: emailController.value.text.isNotEmpty
                        ? onSubmit
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(global_style.lightBlueAccentColor),
                    ),
                    child: Text(
                      "Send Email",
                      style: TextStyle(fontFamily: global_style.textFont),
                    )))),
      ]),
    )));
  }
}
