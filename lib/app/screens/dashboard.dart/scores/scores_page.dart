import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subjects_page.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';
import 'package:midterm_exam/app/utils/shared_preference_helper.dart';

import '../../../global/constants/colors.dart';

class ScoresPage extends StatefulWidget {
  final bool displayScores;
  final bool isOOP;
  const ScoresPage({
    super.key,
    this.displayScores = false,
    this.isOOP = true,
  });

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  int quiz1Score = 0;
  int quiz2Score = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getScores());
  }

  void getScores() {
    final quiz1Key = widget.isOOP ? 'oopQuiz1Score' : 'dbmsQuiz1Score';
    final quiz2Key = widget.isOOP ? 'oopQuiz2Score' : 'dbmsQuiz2Score';
    quiz1Score = SharedPreferencesHelper.getInt(quiz1Key) ?? 0;
    quiz2Score = SharedPreferencesHelper.getInt(quiz2Key) ?? 0;
    setState(() {});
  }

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
              image: AssetImage("assets/backgrounds/scores_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                if (widget.displayScores) {
                                  PageNavigator.pushAndRemoveStack(context, const ScoresPage());
                                } else {
                                  PageNavigator.pushAndRemoveStack(context, const SubjectsPage());
                                }
                              }
                            },
                            icon: const Icon(Icons.arrow_back_rounded, color: white),
                          ),
                          Center(
                            child: Text(
                              widget.displayScores
                                  ? widget.isOOP
                                      ? 'IT 5 (OOP)'
                                      : 'IT 6 (DBMS)'
                                  : 'Scores',
                              style: const TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Spacer(),
                            widget.displayScores
                                ? scoreCard(label: 'Quiz 1', score: quiz1Score.toString())
                                : subjectCard(
                                    label: 'IT 5 (OOP)',
                                    onTap: widget.displayScores
                                        ? null
                                        : () => PageNavigator.push(
                                              context,
                                              const ScoresPage(
                                                displayScores: true,
                                                isOOP: true,
                                              ),
                                            ),
                                  ),
                            const SizedBox(height: 48),
                            widget.displayScores
                                ? scoreCard(label: 'Quiz 2', score: quiz2Score.toString())
                                : subjectCard(
                                    label: 'IT 6 (DBMS)',
                                    onTap: widget.displayScores
                                        ? null
                                        : () => PageNavigator.push(
                                              context,
                                              const ScoresPage(
                                                displayScores: true,
                                                isOOP: false,
                                              ),
                                            ),
                                  ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget subjectCard({required String label, required void Function()? onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardLightColor.withOpacity(0.75),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: double.maxFinite,
            height: 170,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 48,
                  fontFamily: 'Brams',
                  color: white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scoreCard({required String label, required String score}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardLightColor.withOpacity(0.75),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: double.maxFinite,
          height: 170,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Brams',
                    color: white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      score,
                      style: const TextStyle(
                        fontSize: 48,
                        fontFamily: 'Brams',
                        color: white,
                      ),
                    ),
                    const Text(
                      '/5',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Brams',
                        color: white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
