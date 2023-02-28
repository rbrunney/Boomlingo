import 'package:boomlingo/pages/login/forgot_password_page.dart';
import 'package:boomlingo/pages/login/register_page.dart';
import 'package:boomlingo/util/page_navigation.dart';
import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:boomlingo/util/widgets/page_image.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Login Page State
class _LoginPageState extends State<LoginPage> {
  // Making Controllers so we can get the text information later
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String username = '';
  String password = '';

  String? get usernameErrorText {
    final text = _usernameController.text;

    if (text.isEmpty) {
      return 'Field is Empty!';
    }

    return null;
  }

  String? get passwordErrorText {
    final text = _passwordController.text;

    if (text.isEmpty) {
      return 'Field is Empty!';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
      child: Column(
        children: [
          const PageImage(assetImg: 'assets/images/icon.png', marginTop: 55),
          const PageTitle(title: "Login"),
          CustomTextField(
            textCallBack: (value) {},
            hintText: "Enter Username...",
            labelText: "Enter Username",
            prefixIcon: Icons.account_circle_outlined,
            textController: _usernameController,
            errorText: usernameErrorText,
          ),
          CustomTextField(
            textCallBack: (value) {},
            hintText: "Enter Password...",
            labelText: "Enter Password",
            isObscure: true,
            hasSuffixIcon: true,
            prefixIcon: Icons.lock_outline,
            suffixIcon: Icons.visibility_off_outlined,
            pressedSuffixIcon: Icons.visibility_outlined,
            textController: _passwordController,
            errorText: passwordErrorText,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ForgotPasswordPage(
                          title: "Forgot",
                        ),
                        type: PageTransitionType.rightToLeftWithFade));
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Forgot Password?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontFamily: global_style.textFont)))),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: ElevatedButton(
                      onPressed: () {
                        
                        // Make Request Login
                        
                            // Save the JWT tokens to the system.
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const PageNavigation(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(global_style.lightBlueAccentColor),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontFamily: global_style.textFont),
                      )))),
          Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "New to Boomlingo?",
                      style: TextStyle(
                        fontFamily: global_style.textFont,
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const RegisterPage(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontFamily: global_style.textFont),
                      ))
                ],
              ))
        ],
      ),
    )));
  }
}
