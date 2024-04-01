import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../global/constants/colors.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScorePage> {
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
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_rounded, color: white),
                          ),
                          const Center(
                            child: Text(
                              'Scores',
                              style: TextStyle(fontFamily: 'Brams', fontSize: 36, color: white),
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
                            subjectCard(label: 'IT 5 (OOP)', onTap: () {}),
                            const SizedBox(height: 48),
                            subjectCard(label: 'IT 6 (DBMS)', onTap: () {}),
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
          onTap: () {},
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
}
