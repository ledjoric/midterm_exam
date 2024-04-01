import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/global/widgets/primary_button.dart';
import 'package:midterm_exam/app/screens/captcha_page.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds/light_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset('assets/clove_transparent.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      'welcome',
                      style: TextStyle(fontFamily: 'Brams', fontSize: 52, height: 1, color: labelPurple),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'to clove',
                      style: TextStyle(fontFamily: 'Brams', fontSize: 52, height: 1, color: labelPurple),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Welcome to CLOVE: Comprehensive Learning Online Virtual Environment. Enter and dive into our modules for comprehensive understanding and test your knowledge with interactive quizzes. Whether you\'re new to the concepts or seeking to sharpen your skills, join us on this educational journey to master the worlds of Object-Oriented Programming and Database Management System.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.bold, color: labelPurple),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      label: 'Start',
                      onPressed: () => PageNavigator.push(context, const CaptchaPage()),
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
}
