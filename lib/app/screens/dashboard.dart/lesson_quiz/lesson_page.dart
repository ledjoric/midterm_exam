import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/global/constants/strings/lessons.dart';
import 'package:midterm_exam/app/global/constants/strings/quizzes.dart';
import 'package:midterm_exam/app/models/quiz.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/lesson_quiz/quiz_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subject_page.dart';
import 'package:midterm_exam/app/utils/dialog_helper.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';
import 'package:midterm_exam/app/utils/shared_preference_helper.dart';

class LessonPage extends StatefulWidget {
  final bool isOOP;
  final String lesson;
  final String title;

  const LessonPage({
    super.key,
    this.isOOP = true,
    required this.lesson,
    required this.title,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final ScrollController _scrollController = ScrollController();

  String bottomButtonLabel = '';
  String key = '';
  Widget? navigate;

  bool isButtonUnlocked = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);

    if (widget.title == 'LESSON 2' || widget.title == 'LESSON 4') {
      isButtonUnlocked = false;
    }

    if (widget.title == 'LESSON 2') {
      isButtonUnlocked = widget.isOOP
          ? ((SharedPreferencesHelper.getBool('oopLesson1') ?? false) && (SharedPreferencesHelper.getBool('oopLesson2') ?? false))
          : ((SharedPreferencesHelper.getBool('dbmsLesson1') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson2') ?? false));
    } else if (widget.title == 'LESSON 4') {
      isButtonUnlocked = widget.isOOP
          ? ((SharedPreferencesHelper.getBool('oopLesson3') ?? false) && (SharedPreferencesHelper.getBool('oopLesson4') ?? false))
          : ((SharedPreferencesHelper.getBool('dbmsLesson3') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson4') ?? false));
    }

    Map<String, dynamic> navigationMap = {
      'LESSON 1': {
        'bottomButtonLabel': 'LESSON 2',
        'navigate': LessonPage(
          lesson: widget.isOOP ? Lessons.oopLessons[1] : Lessons.dbmsLessons[1],
          title: 'LESSON 2',
          isOOP: widget.isOOP,
        ),
        'key': widget.isOOP ? 'oopLesson1' : 'dbmsLesson1',
      },
      'LESSON 2': {
        'bottomButtonLabel': 'QUIZ 1',
        'navigate': QuizPage(
          quiz: getRandomizedQuizList(widget.isOOP ? Quizzes.oopQuiz1 : Quizzes.dbmsQuiz1),
          isOOP: widget.isOOP,
          spKey: widget.isOOP ? 'oopQuiz1' : 'dbmsQuiz1',
        ),
        'key': widget.isOOP ? 'oopLesson2' : 'dbmsLesson2',
      },
      'LESSON 3': {
        'bottomButtonLabel': 'LESSON 4',
        'navigate': LessonPage(
          lesson: widget.isOOP ? Lessons.oopLessons[3] : Lessons.dbmsLessons[3],
          title: 'LESSON 4',
          isOOP: widget.isOOP,
        ),
        'key': widget.isOOP ? 'oopLesson3' : 'dbmsLesson3',
      },
      'LESSON 4': {
        'bottomButtonLabel': 'QUIZ 2',
        'navigate': QuizPage(
          quiz: getRandomizedQuizList(widget.isOOP ? Quizzes.oopQuiz2 : Quizzes.dbmsQuiz2),
          isOOP: widget.isOOP,
          spKey: widget.isOOP ? 'oopQuiz2' : 'dbmsQuiz2',
        ),
        'key': widget.isOOP ? 'oopLesson4' : 'dbmsLesson4',
      },
    };

    var data = navigationMap[widget.title];
    if (data != null) {
      bottomButtonLabel = data['bottomButtonLabel'];
      navigate = data['navigate'];
      key = data['key'];
    } else {
      bottomButtonLabel = '';
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.isOOP ? "assets/backgrounds/cat_bg.jpg" : "assets/backgrounds/heart_bg.jpg"),
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
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              if (widget.isOOP) {
                                PageNavigator.pushAndRemoveStack(
                                  context,
                                  const SubjectPage(isDark: false, title: 'IT 5 (00P)', isOOP: true),
                                );
                              } else {
                                PageNavigator.pushAndRemoveStack(
                                  context,
                                  const SubjectPage(isDark: true, title: 'IT 6 (DBMS)', isOOP: false),
                                );
                              }
                            }
                          },
                          icon: const Icon(Icons.arrow_back_rounded, color: white),
                        ),
                        Expanded(
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'Brams', fontSize: 48, color: white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(widget.isOOP ? 'assets/cat_logo.png' : 'assets/heart_logo.png'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: white),
                                color: lessonCardColor,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Scrollbar(
                                radius: const Radius.circular(8),
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Html(
                                    data: widget.lesson,
                                    shrinkWrap: true,
                                    style: {
                                      "*": Style(fontFamily: 'Inter'),
                                      "h1": Style(
                                        textAlign: TextAlign.center,
                                        margin: Margins.only(bottom: 16),
                                        fontWeight: FontWeight.w800,
                                        fontSize: FontSize(20),
                                      ),
                                      "h2": Style(
                                        margin: Margins.only(bottom: 4),
                                        fontWeight: FontWeight.w800,
                                        fontSize: FontSize(18),
                                      ),
                                      "h3": Style(
                                        textAlign: TextAlign.center,
                                        alignment: Alignment.center,
                                        verticalAlign: VerticalAlign.middle,
                                        margin: Margins.only(bottom: 4),
                                        fontWeight: FontWeight.w800,
                                        fontSize: FontSize(16),
                                      ),
                                      "p": Style(
                                        margin: Margins.only(bottom: 24, left: 16),
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontSize(16),
                                      ),
                                      "ol": Style(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontSize(16),
                                      ),
                                      "ul": Style(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontSize(16),
                                      ),
                                      "li": Style(
                                        margin: Margins.only(bottom: 4),
                                      ),
                                      "strong": Style(fontWeight: FontWeight.w800),
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Opacity(
                            opacity: isButtonUnlocked ? 1 : 0.5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: white, width: 3),
                                color: lessonCardColor,
                                image: const DecorationImage(
                                  image: AssetImage('assets/backgrounds/light_bg.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: isButtonUnlocked ? () => PageNavigator.push(context, navigate!) : showReadLessonDialog,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      bottomButtonLabel,
                                      style: const TextStyle(
                                        fontFamily: 'Brams',
                                        fontSize: 40,
                                        color: labelPurple,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  List<Quiz> getRandomizedQuizList(List<Map<String, String>> quiz) {
    List<Quiz> quizList = quiz.map((data) => Quiz.fromJson(data)).toList();

    quizList.shuffle();

    List<Quiz> randomQuizList = quizList.take(5).toList();

    return randomQuizList;
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      final bool? isLessonComplete = SharedPreferencesHelper.getBool(key);

      if (isLessonComplete == null) {
        SharedPreferencesHelper.setBool(key, true);
      }

      if (widget.title == 'LESSON 2') {
        isButtonUnlocked = widget.isOOP
            ? ((SharedPreferencesHelper.getBool('oopLesson1') ?? false) && (SharedPreferencesHelper.getBool('oopLesson2') ?? false))
            : ((SharedPreferencesHelper.getBool('dbmsLesson1') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson2') ?? false));
      } else if (widget.title == 'LESSON 4') {
        isButtonUnlocked = widget.isOOP
            ? ((SharedPreferencesHelper.getBool('oopLesson3') ?? false) && (SharedPreferencesHelper.getBool('oopLesson4') ?? false))
            : ((SharedPreferencesHelper.getBool('dbmsLesson3') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson4') ?? false));
      }
      setState(() {});
    }
  }

  void showReadLessonDialog() {
    String lessonString = '';
    if (widget.title == 'LESSON 2') {
      lessonString = 'lessons 1 and 2';
    } else if (widget.title == 'LESSON 4') {
      lessonString = 'lessons 3 and 4';
    }

    DialogHelper.showMessageDialog(
        context: context,
        imagePath: 'assets/dialog_icons/fail.png',
        contentText:
            'Please make sure to read $lessonString before taking the quiz. Scroll all the way down to ensure you have covered all the material.',
        buttonLabel: 'Okay',
        onConfirm: () => Navigator.pop(context));
  }
}
