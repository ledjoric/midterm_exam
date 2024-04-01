import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/widgets/custom_text_field.dart';
import 'package:midterm_exam/app/global/widgets/primary_button.dart';
import 'package:midterm_exam/app/global/widgets/secondary_button.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subjects_page.dart';
import 'package:midterm_exam/app/utils/dialog_helper.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';

import '../global/constants/colors.dart';

class CaptchaPage extends StatefulWidget {
  const CaptchaPage({super.key});

  @override
  State<CaptchaPage> createState() => _CaptchaPageState();
}

class _CaptchaPageState extends State<CaptchaPage> {
  TextEditingController? captchaController;
  String captchaCode = '';

  @override
  void initState() {
    super.initState();

    captchaController = TextEditingController();
    captchaController!.addListener(() => setState(() {}));
    generateCaptcha();
  }

  @override
  void dispose() {
    captchaController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF1C1A49),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.maxFinite,
                    color: Colors.red,
                    child: Image.asset(
                      'assets/captcha_header.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontFamily: 'Brams',
                        fontSize: 56,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      captchaCode,
                      style: const TextStyle(
                        color: white,
                        fontSize: 48,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      color: white,
                      indent: 48,
                      endIndent: 48,
                    ),
                    const Text(
                      'Captcha code',
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      controller: captchaController,
                      hintText: 'Enter Captcha here',
                      maxLength: 6,
                    ),
                    const SizedBox(height: 48),
                    SecondaryButton(
                      label: 'Generate Captcha',
                      onPressed: generateCaptcha,
                      hasIcon: true,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      label: 'Enter',
                      backgroundColor: lightPrimaryColor,
                      onPressed:
                          // () => PageNavigator.pushAndRemoveStack(context, const SubjectsPage()),
                          captchaController == null || (captchaController!.text.isEmpty || captchaController!.text.length != 6) ? null : enterCaptcha,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateCaptcha() {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String result = '';
    for (int i = 0; i < 6; i++) {
      result += chars[random.nextInt(chars.length)];
    }
    setState(() => captchaCode = result);
  }

  void enterCaptcha() {
    if (captchaController!.text == captchaCode) {
      PageNavigator.pushAndRemoveStack(context, const SubjectsPage());
    } else {
      DialogHelper.showMessageDialog(
        context: context,
        buttonLabel: 'Okay',
        contentText: 'Incorrect captcha. Please enter the correct captcha code.',
        imagePath: 'assets/dialog_icons/fail.png',
        onConfirm: () {
          generateCaptcha();
          captchaController!.clear();
          Navigator.pop(context);
        },
      );
    }
  }
}
