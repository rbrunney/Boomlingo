import 'package:boomlingo/util/widgets/custom_text_field.dart';
import 'package:boomlingo/util/widgets/page_title.dart';
import 'package:boomlingo/util/widgets/to_previous_page.dart';
import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const ToPrevPage(),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: const PageTitle(
                title: "Contact Boomlingo",
                alignment: Alignment.center,
              )),
          CustomTextField(
            textCallBack: (value) {},
            hintText: 'Enter Email...',
            labelText: 'Enter Email',
            prefixIcon: Icons.email_outlined,
            textController: emailController,
            errorText: emailErrorText,
          ),
          CustomTextField(
            maxLines: 20,
            textCallBack: (value) {},
            hintText: 'Enter Message...',
            labelText: 'Enter Message',
            prefixIcon: Icons.notes_outlined,
            textController: messageController,
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
                        "Send Message",
                        style: TextStyle(fontFamily: global_style.textFont),
                      )))),
        ],
      )),
    ));
  }
}
