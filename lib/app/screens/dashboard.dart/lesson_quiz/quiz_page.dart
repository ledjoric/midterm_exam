import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/global/constants/strings/lessons.dart';
import 'package:midterm_exam/app/global/widgets/custom_text_field.dart';
import 'package:midterm_exam/app/global/widgets/primary_button.dart';
import 'package:midterm_exam/app/models/quiz.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/lesson_quiz/lesson_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subject_page.dart';
import 'package:midterm_exam/app/utils/dialog_helper.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';
import 'package:midterm_exam/app/utils/shared_preference_helper.dart';

class QuizPage extends StatefulWidget {
  final List<Quiz> quiz;
  final String spKey;
  final bool isOOP;
  const QuizPage({
    super.key,
    required this.quiz,
    required this.spKey,
    required this.isOOP,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TextEditingController? answerController;

  int score = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
    answerController = TextEditingController();
    answerController!.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      IconButton(
                        onPressed: () => DialogHelper.showConfirmationDialog(
                          context: context,
                          contentText: 'Do you want to exit?',
                          onConfirm: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                        icon: const Icon(Icons.arrow_back_rounded, color: white),
                      ),
                      Center(
                        child: Text(
                          'QUESTION ${index + 1}\nIDENTIFICATION',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Score: ',
                      style: TextStyle(fontFamily: 'Brams', fontSize: 20, color: white),
                    ),
                    Text(
                      score.toString(),
                      style: const TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        widget.quiz[index].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        controller: answerController,
                        hintText: 'Enter your answer',
                      ),
                      const SizedBox(height: 32),
                      PrimaryButton(
                        label: 'Submit',
                        backgroundColor: labelPurple,
                        onPressed: (answerController == null || answerController!.text.isEmpty)
                            ? null
                            : () async {
                                if (index + 1 != widget.quiz.length) {
                                  if (answerController!.text.replaceAll(';', '').toLowerCase() == widget.quiz[index].answer.toLowerCase()) {
                                    score++;
                                  }
                                  index++;
                                  answerController!.clear();
                                  setState(() {});
                                } else {
                                  if (score > 2) {
                                    await SharedPreferencesHelper.setBool(widget.spKey, true).then(
                                      (value) async {
                                        if (widget.spKey == 'oopQuiz1' || widget.spKey == 'dbmsQuiz1') {
                                          if (widget.spKey == 'oopQuiz1') {
                                            await SharedPreferencesHelper.setInt('oopQuiz1Score', score).then((value) => showMessageDialog());
                                          } else if (widget.spKey == 'dbmsQuiz1') {
                                            await SharedPreferencesHelper.setInt('dbmsQuiz1Score', score).then((value) => showMessageDialog());
                                          }
                                        } else if (widget.spKey == 'oopQuiz2' || widget.spKey == 'dbmsQuiz2') {
                                          if (widget.spKey == 'oopQuiz2') {
                                            await SharedPreferencesHelper.setInt('oopQuiz2Score', score).then((value) => showMidtermDialog());
                                          } else if (widget.spKey == 'dbmsQuiz2') {
                                            await SharedPreferencesHelper.setInt('dbmsQuiz2Score', score).then((value) => showMidtermDialog());
                                          }
                                        }
                                      },
                                    );
                                  } else {
                                    DialogHelper.showMessageDialog(
                                      context: context,
                                      imagePath: 'assets/dialog_icons/fail.png',
                                      contentText: 'Sorry, you did not pass the quiz. Please review the material and try again.:<',
                                      buttonLabel: 'Okay',
                                      onConfirm: () {
                                        if (widget.spKey == 'oopQuiz1' || widget.spKey == 'dbmsQuiz1') {
                                          PageNavigator.pushAndRemoveStack(
                                            context,
                                            LessonPage(
                                              lesson: widget.isOOP ? Lessons.oopLessons[0] : Lessons.dbmsLessons[0],
                                              title: 'LESSON 1',
                                              isOOP: widget.isOOP,
                                            ),
                                          );
                                        } else if (widget.spKey == 'oopQuiz2' || widget.spKey == 'dbmsQuiz2') {
                                          PageNavigator.pushAndRemoveStack(
                                            context,
                                            LessonPage(
                                              lesson: widget.isOOP ? Lessons.oopLessons[2] : Lessons.dbmsLessons[2],
                                              title: 'LESSON 3',
                                              isOOP: widget.isOOP,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMessageDialog() {
    DialogHelper.showMessageDialog(
      context: context,
      imagePath: 'assets/dialog_icons/success.png',
      contentText: 'Congratulations! You passed the quiz. Continue to the next lesson. :3',
      buttonLabel: 'Next Lesson',
      onConfirm: () async {
        PageNavigator.pushAndRemoveStack(
          context,
          LessonPage(
            lesson: widget.isOOP ? Lessons.oopLessons[2] : Lessons.dbmsLessons[2],
            title: 'LESSON 3',
            isOOP: widget.isOOP,
          ),
        );
      },
    );
  }

  void showMidtermDialog() {
    DialogHelper.showMidtermDialog(
      context: context,
      isOOP: widget.isOOP,
      imagePath: 'assets/dialog_icons/success.png',
      contentText: 'Congratulations! You passed all of the quizzes! You can now proceed to the Midterm Exam! :3',
      buttonLabel: 'Next Lesson',
      onConfirm: () async {
        if (widget.spKey == 'oopQuiz2') {
          PageNavigator.pushAndRemoveStack(
            context,
            const SubjectPage(isDark: false, title: 'IT 5 (00P)', isOOP: true),
          );
        } else if (widget.spKey == 'dbmsQuiz2') {
          PageNavigator.pushAndRemoveStack(
            context,
            const SubjectPage(isDark: true, title: 'IT 6 (DBMS)', isOOP: false),
          );
        }
      },
    );
  }
}
