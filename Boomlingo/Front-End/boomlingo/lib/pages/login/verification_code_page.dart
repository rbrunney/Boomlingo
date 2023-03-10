import 'package:boomlingo/pages/login/change_password_page.dart';
import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:boomlingo/util/widgets/page_image.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../../util/requests/requests.dart';

class VerificationCodePage extends StatefulWidget {
  final String userEmail;
  const VerificationCodePage({Key? key, this.userEmail = ''}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('What the nut');
    Requests().makePostRequest("https://i3n5l740cj.execute-api.us-west-1.amazonaws.com/boomlingo/sendemail", {
      "user_email": widget.userEmail,
      "verification_code": 738491
    });
  }

  String? get verificationCodeErrorText {
    final text = codeController.text;

    if (text.isEmpty) {
      return 'Field is Empty!';
    } else if (text.length > 6 || text.length < 6) {
      return 'Invalid Code!';
    }

    return null;
  }

  void onSubmit() {

    if(int.parse(codeController.text) == 738491) {
      // Send code off to get validated
      Navigator.push(
          context,
          PageTransition(
              child: const ChangePasswordPage(
                  token: "test"),
              type: PageTransitionType.rightToLeftWithFade));
    }
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
        const PageTitle(title: "Enter Code"),
        CustomText(
          leftMargin: 15,
          rightMargin: 15,
          topMargin: 10,
          bottomMargin: 10,
          text:
              "We have sent an email with your verification code! Please check your email.",
          fontSize: 15,
        ),
        CustomTextField(
            textCallBack: (value) {},
            hintText: 'Enter Verification Code...',
            labelText: 'Enter Verification Code',
            errorText: verificationCodeErrorText,
            textInputType: TextInputType.number,
            textFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: Icons.dialpad_outlined,
            
            prefixIconPress: () {},
            textController: codeController),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                    onPressed:
                        codeController.text.isNotEmpty ? onSubmit : () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(global_style.lightBlueAccentColor),
                    ),
                    child: Text(
                      "Submit Code",
                      style: TextStyle(fontFamily: global_style.textFont),
                    )))),
      ],
    ))));
  }
}
