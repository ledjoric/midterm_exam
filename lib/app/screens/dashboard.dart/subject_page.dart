import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/global/constants/strings/lessons.dart';
import 'package:midterm_exam/app/models/quiz.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/lesson_quiz/lesson_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/lesson_quiz/quiz_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subjects_page.dart';
import 'package:midterm_exam/app/utils/dialog_helper.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';
import 'package:midterm_exam/app/utils/shared_preference_helper.dart';

import '../../global/constants/strings/quizzes.dart';

class SubjectPage extends StatefulWidget {
  final String title;
  final bool isDark;
  final bool isOOP;
  const SubjectPage({
    super.key,
    this.isDark = false,
    required this.title,
    required this.isOOP,
  });

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<String> lightIcons = [
    'assets/subject_cards/light/lesson1.png',
    'assets/subject_cards/light/lesson2.png',
    'assets/subject_cards/light/lesson3.png',
    'assets/subject_cards/light/lesson4.png',
  ];

  List<String> darkIcons = [
    'assets/subject_cards/dark/lesson1.png',
    'assets/subject_cards/dark/lesson2.png',
    'assets/subject_cards/dark/lesson3.png',
    'assets/subject_cards/dark/lesson4.png',
  ];

  List<String> icons = [];

  bool isLesson3Unlocked = false;
  bool isLesson4Unlocked = false;
  bool isQuiz1Unlocked = false;
  bool isQuiz2Unlocked = false;
  bool isMidtermUnlocked = false;

  List<String> lessons = [];

  @override
  void initState() {
    super.initState();
    icons = widget.isDark ? darkIcons : lightIcons;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      lessons = widget.isOOP ? Lessons.oopLessons : Lessons.dbmsLessons;
      widget.isOOP ? checkOOPUnlock() : checkDBMSUnlock();
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isOOP ? checkOOPUnlock() : checkDBMSUnlock();
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: widget.isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.isDark ? "assets/backgrounds/dark_bg.png" : "assets/backgrounds/light_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: SingleChildScrollView(
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
                            PageNavigator.pushAndRemoveStack(context, const SubjectsPage());
                          }
                        },
                        icon: const Icon(Icons.arrow_back_rounded, color: white),
                      ),
                      Center(
                        child: Text(
                          widget.title,
                          style: const TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          card(
                            imgPath: icons[0],
                            label: 'Lesson 1',
                            onTap: () => PageNavigator.push(
                              context,
                              LessonPage(
                                isOOP: widget.isOOP,
                                lesson: lessons[0],
                                title: 'LESSON 1',
                              ),
                            ),
                          ),
                          card(
                            imgPath: icons[1],
                            label: 'Lesson 2',
                            onTap: () => PageNavigator.push(
                              context,
                              LessonPage(
                                isOOP: widget.isOOP,
                                lesson: lessons[1],
                                title: 'LESSON 2',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          card(
                            imgPath: icons[2],
                            label: 'Lesson 3',
                            isUnlocked: isLesson3Unlocked,
                            onTap: () {
                              if (isLesson3Unlocked) {
                                PageNavigator.push(
                                  context,
                                  LessonPage(
                                    isOOP: widget.isOOP,
                                    lesson: lessons[2],
                                    title: 'LESSON 3',
                                  ),
                                );
                              } else {
                                showLockedLessonDialog();
                              }
                            },
                          ),
                          card(
                            imgPath: icons[3],
                            label: 'Lesson 4',
                            isUnlocked: isLesson4Unlocked,
                            onTap: () {
                              if (isLesson4Unlocked) {
                                PageNavigator.push(
                                  context,
                                  LessonPage(
                                    isOOP: widget.isOOP,
                                    lesson: lessons[3],
                                    title: 'LESSON 4',
                                  ),
                                );
                              } else {
                                showLockedLessonDialog();
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          card(
                            title: 'Quiz 1',
                            hasLabel: false,
                            isUnlocked: isQuiz1Unlocked,
                            onTap: () {
                              if (isQuiz1Unlocked) {
                                PageNavigator.push(
                                  context,
                                  QuizPage(
                                    quiz: getRandomizedQuizList(widget.isOOP ? Quizzes.oopQuiz1 : Quizzes.dbmsQuiz1),
                                    isOOP: widget.isOOP,
                                    spKey: widget.isOOP ? 'oopQuiz1' : 'dbmsQuiz1',
                                  ),
                                );
                              } else {
                                showLockedQuizDialog('Study Lesson 1 and Lesson 2 before attempting Quiz 1.');
                              }
                            },
                          ),
                          card(
                            title: 'Quiz 2',
                            hasLabel: false,
                            isUnlocked: isQuiz2Unlocked,
                            onTap: () {
                              if (isQuiz2Unlocked) {
                                PageNavigator.push(
                                  context,
                                  QuizPage(
                                    quiz: getRandomizedQuizList(widget.isOOP ? Quizzes.oopQuiz2 : Quizzes.dbmsQuiz2),
                                    isOOP: widget.isOOP,
                                    spKey: widget.isOOP ? 'oopQuiz2' : 'dbmsQuiz2',
                                  ),
                                );
                              } else {
                                showLockedQuizDialog('Study Lesson 3 and Lesson 4 before attempting Quiz 2.');
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: Opacity(
                          opacity: isMidtermUnlocked ? 1 : 0.6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.isDark ? cardDarkColor : cardLightColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (isMidtermUnlocked) {
                                    // DialogHelper.showMessageDialog(
                                    //   context: context,
                                    //   imagePath: 'assets/dialog_icons/fail.png',
                                    //   contentText: 'Midterm Exam',
                                    //   buttonLabel: 'Okay',
                                    //   onConfirm: () => Navigator.pop(context),
                                    // );
                                  } else {
                                    DialogHelper.showMessageDialog(
                                      context: context,
                                      imagePath: 'assets/dialog_icons/fail.png',
                                      contentText: 'Before proceeding to the midterm exam, you must successfully complete Quiz 1 and Quiz 2. :3',
                                      buttonLabel: 'Okay',
                                      onConfirm: () => Navigator.pop(context),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Center(
                                    child: Text(
                                      'MIDTERM',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontFamily: 'Brams',
                                        color: widget.isDark ? labelPurple : white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void checkOOPUnlock() {
    bool isLesson12Complete = (SharedPreferencesHelper.getBool('oopLesson1') ?? false) && (SharedPreferencesHelper.getBool('oopLesson2') ?? false);
    bool isLesson34Complete = (SharedPreferencesHelper.getBool('oopLesson3') ?? false) && (SharedPreferencesHelper.getBool('oopLesson4') ?? false);
    bool quiz1Passed = SharedPreferencesHelper.getBool('oopQuiz1') ?? false;
    bool quiz2Passed = SharedPreferencesHelper.getBool('oopQuiz2') ?? false;

    isLesson3Unlocked = quiz1Passed;
    isLesson4Unlocked = quiz1Passed;
    isQuiz1Unlocked = isLesson12Complete;
    isQuiz2Unlocked = isLesson34Complete;
    isMidtermUnlocked = quiz2Passed;
    setState(() {});
  }

  void checkDBMSUnlock() {
    bool isLesson12Complete = (SharedPreferencesHelper.getBool('dbmsLesson1') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson2') ?? false);
    bool isLesson34Complete = (SharedPreferencesHelper.getBool('dbmsLesson3') ?? false) && (SharedPreferencesHelper.getBool('dbmsLesson4') ?? false);
    bool quiz1Passed = SharedPreferencesHelper.getBool('dbmsQuiz1') ?? false;
    bool quiz2Passed = SharedPreferencesHelper.getBool('dbmsQuiz2') ?? false;

    isLesson3Unlocked = quiz1Passed;
    isLesson4Unlocked = quiz1Passed;
    isQuiz1Unlocked = isLesson12Complete;
    isQuiz2Unlocked = isLesson34Complete;
    isMidtermUnlocked = quiz2Passed;
    setState(() {});
  }

  void showLockedLessonDialog() {
    DialogHelper.showMessageDialog(
      context: context,
      imagePath: 'assets/dialog_icons/fail.png',
      contentText: 'To access this module, you must successfully complete Quiz 1.',
      buttonLabel: 'Okay',
      onConfirm: () => Navigator.pop(context),
    );
  }

  void showLockedQuizDialog(String message) {
    DialogHelper.showMessageDialog(
      context: context,
      imagePath: 'assets/dialog_icons/fail.png',
      contentText: message,
      buttonLabel: 'Okay',
      onConfirm: () => Navigator.pop(context),
    );
  }

  List<Quiz> getRandomizedQuizList(List<Map<String, String>> quiz) {
    List<Quiz> quizList = quiz.map((data) => Quiz.fromJson(data)).toList();

    quizList.shuffle();

    List<Quiz> randomQuizList = quizList.take(5).toList();

    return randomQuizList;
  }

  Widget card({
    String? imgPath,
    String? title,
    String? label,
    bool hasLabel = true,
    void Function()? onTap,
    bool isUnlocked = true,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Opacity(
            opacity: isUnlocked ? 1 : 0.6,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isDark ? cardDarkColor : cardLightColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: imgPath != null
                          ? Image.asset(imgPath)
                          : title != null
                              ? Text(
                                  title,
                                  style: TextStyle(fontSize: 48, fontFamily: 'Brams', color: widget.isDark ? labelPurple : white),
                                )
                              : const SizedBox.shrink(),
                    ),
                  ),
                ),
                if (hasLabel && label != null)
                  Text(
                    label,
                    style: TextStyle(fontSize: 32, color: widget.isDark ? white : labelPurple, fontFamily: 'Brams'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
