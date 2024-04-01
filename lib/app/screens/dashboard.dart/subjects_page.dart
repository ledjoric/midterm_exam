import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/screens/captcha_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/members_page/members_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/scores/scores_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subject_page.dart';
import 'package:midterm_exam/app/utils/dialog_helper.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<String> cardBgPaths = [
    'assets/subjects/it5.jpg',
    'assets/subjects/it6.jpg',
    'assets/subjects/scores.jpg',
    'assets/subjects/programmers.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds/dark_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const Text(
                        'WELCOME!',
                        style: TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          DialogHelper.showConfirmationDialog(
                            context: context,
                            contentText: 'Do you want to logout?',
                            onConfirm: () => PageNavigator.pushAndRemoveStack(context, const CaptchaPage()),
                          );
                        },
                        icon: const Icon(Icons.logout_rounded, color: white),
                      ),
                    ],
                  ),
                ),
                subejectCard(
                  bgPath: cardBgPaths[0],
                  label: 'IT 5 (00P)',
                  onTap: () => PageNavigator.push(
                    context,
                    const SubjectPage(isDark: false, title: 'IT 5 (00P)', isOOP: true),
                  ),
                ),
                subejectCard(
                  bgPath: cardBgPaths[1],
                  label: 'IT 6 (DBMS)',
                  onTap: () => PageNavigator.push(
                    context,
                    const SubjectPage(isDark: true, title: 'IT 6 (DBMS)', isOOP: false),
                  ),
                ),
                subejectCard(
                  bgPath: cardBgPaths[2],
                  label: 'Scores',
                  onTap: () => PageNavigator.push(context, const ScoresPage()),
                ),
                subejectCard(
                  bgPath: cardBgPaths[3],
                  label: 'programmers',
                  onTap: () => PageNavigator.push(context, const MembersPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget subejectCard({
    required String bgPath,
    required String label,
    required void Function()? onTap,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: white),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgPath),
                fit: BoxFit.cover,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(
                      child: Text(
                        label,
                        style: const TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
