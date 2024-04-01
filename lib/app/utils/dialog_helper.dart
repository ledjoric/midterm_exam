import 'package:flutter/material.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/scores/scores_page.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/subjects_page.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';

import '../global/widgets/primary_button.dart';
import '../global/widgets/secondary_button.dart';

class DialogHelper {
  static void showConfirmationDialog({
    required BuildContext context,
    required String contentText,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/dialog_icons/question.png'),
              const SizedBox(height: 16),
              Text(
                contentText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Column(
              children: [
                SecondaryButton(
                  label: 'No',
                  onPressed: () => Navigator.pop(context),
                  color: labelPurple,
                  padding: const EdgeInsets.all(10),
                ),
                PrimaryButton(
                  label: 'Yes',
                  backgroundColor: labelPurple,
                  onPressed: onConfirm,
                  padding: const EdgeInsets.all(10),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static void showMessageDialog({
    required BuildContext context,
    required String imagePath,
    required String contentText,
    required String buttonLabel,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath),
              const SizedBox(height: 16),
              Text(
                contentText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            PrimaryButton(
              label: buttonLabel,
              backgroundColor: labelPurple,
              onPressed: onConfirm,
              padding: const EdgeInsets.all(10),
            ),
          ],
        );
      },
    );
  }

  static void showMidtermDialog({
    required BuildContext context,
    required String imagePath,
    required String contentText,
    required String buttonLabel,
    required VoidCallback onConfirm,
    required bool isOOP,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath),
              const SizedBox(height: 16),
              Text(
                contentText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Column(
              children: [
                SecondaryButton(
                  label: 'Scoreboard',
                  onPressed: () => PageNavigator.pushAndRemoveStack(
                    context,
                    ScoresPage(
                      isOOP: isOOP,
                      displayScores: true,
                    ),
                  ),
                  color: labelPurple,
                  padding: const EdgeInsets.all(10),
                ),
                SecondaryButton(
                  label: 'Main Menu',
                  onPressed: () => PageNavigator.pushAndRemoveStack(context, const SubjectsPage()),
                  color: labelPurple,
                  padding: const EdgeInsets.all(10),
                ),
                PrimaryButton(
                  label: 'Take Midterm Exam',
                  backgroundColor: labelPurple,
                  onPressed: onConfirm,
                  padding: const EdgeInsets.all(10),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
