import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'landing_button.dart';
import './controllers/google_login_controller.dart';
import './controllers/facebook_login_controller.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/pages/register/register_page.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/homePage/home_page.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;
import 'package:boomlingo/util/widgets/custom_text.dart';
import 'package:boomlingo/pages/login/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final googleController = Get.put(GoogleLoginController());
  final facebookController = Get.put(FacebookLoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: buildHeader()),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: [
                          buildMessage(),
                          buildRegisterButton(),
                          buildGoogleSignInButton(),
                          buildFacebookSignInButton(),
                          buildLoginButton()
                        ],
                      )))
            ],
          )),
    );
  }

  Container buildHeader() {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children : [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('./assets/images/icon.png')
              ),
            )
          ]
        ));
  }

  Column buildMessage() {
    return Column(
      children: const [
        PageTitle(
          title: 'Empowering Boomers',
          alignment: Alignment.center,
          fontSize: 30,
          bottomMargin: 0,
        ),
        PageTitle(
          title: 'Made-Simple',
          alignment: Alignment.center,
          fontSize: 30,
        ),
      ],
    );
  }

  LandingButton buildRegisterButton() {
    return LandingButton(
      onTap: () {
        pushToNewPage(const RegisterPage(), PageTransitionType.fade);
      },
      text: 'Register',
      hasFillColor: true,
    );
  }

  LandingButton buildGoogleSignInButton() {
    return LandingButton(
      onTap: () async {
        await googleController.login();
        print(global_data.userData);
        pushToNewPage(const HomePage(), PageTransitionType.bottomToTop);
      },
      hasBorder: true,
      text: 'Continue with Google',
      prefixImagePath: './assets/images/google_logo.png',
    );
  }

  LandingButton buildFacebookSignInButton() {
    return LandingButton(
      onTap: () async {
        await facebookController.login();
        print(global_data.userData);
        pushToNewPage(const HomePage(), PageTransitionType.bottomToTop);
      },
      hasBorder: true,
      text: 'Continue with Facebook',
      prefixImagePath: './assets/images/facebook_logo.png',
    );
  }

  InkWell buildLoginButton() {
    return InkWell(
        onTap: () {
          pushToNewPage(const LoginPage(), PageTransitionType.fade);
        },
        child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.90,
            child: CustomText(
              text: 'Login',
              alignment: Alignment.center,
              fontSize: 16,
              isBold: true,
            )));
  }

  void pushToNewPage(Widget newPage, PageTransitionType transitionType) {
    Navigator.push(
        context,
        PageTransition(
          type: transitionType,
          child: newPage,
        ));
  }
}
