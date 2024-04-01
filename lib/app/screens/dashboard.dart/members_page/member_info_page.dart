import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';

class MemberInfoPage extends StatefulWidget {
  final String imgPath;
  final String info;

  const MemberInfoPage({
    super.key,
    required this.imgPath,
    required this.info,
  });

  @override
  State<MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends State<MemberInfoPage> {
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
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(child: Image.asset(widget.imgPath)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: white),
                                color: cardDarkColor,
                              ),
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                widget.info,
                                style: const TextStyle(fontSize: 16, fontFamily: 'Vanchrome', color: labelPurple),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: labelPurple,
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
}
