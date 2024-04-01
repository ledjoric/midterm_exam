import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:midterm_exam/app/global/constants/colors.dart';
import 'package:midterm_exam/app/screens/dashboard.dart/members_page/member_info_page.dart';
import 'package:midterm_exam/app/utils/page_navigator.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<String> memberInfo = [
    '// Cresha Pritz B. Lobarbio\n\n// bsit_2-2\n\n-->// “continue your dreams, keep sleeping”\n\n-// SAge Main\n\n-// tuxedosam',
    '// Emmanuel C.  Mallari\n\n// bsit_2-2\n\n-->// “simplicity is beauty, and beauty is me”\n\n-// ASTRA Main\n\n-// my melody',
    '// Raz-lei Jirah SJ. Garcia\n\n// bsit_2- 2\n\n-->// “Ang galing”\n\n-// pompompurin\n\n-// SOVA Main',
    '// Rio S. Ocampo\n\n// bsit_2-2\n\n-->// “I am Qiqi. I am a zombie. And I forgot what comes next.” ~Qiqi\n\n-// deadlock Main\n\n-// cinnamoroll',
    '// Oliver R. Ventura\n\n// bsit_2-2\n\n-->// “Wala na ko masabi ayoko na hahaha ba-bye na po!”\n\n-// Kay/o Main\n\n-// Kuromi',
  ];
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
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, color: labelPurple),
                    ),
                    Center(child: Image.asset('assets/mask.png')),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            memberCard(
                              onTap: () => PageNavigator.push(context, MemberInfoPage(imgPath: 'assets/members/member1.png', info: memberInfo[0])),
                              imgPath: 'assets/members/member1.png',
                            ),
                            memberCard(
                              onTap: () => PageNavigator.push(context, MemberInfoPage(imgPath: 'assets/members/member2.png', info: memberInfo[1])),
                              imgPath: 'assets/members/member2.png',
                            ),
                          ],
                        ),
                      ),
                      memberCard(
                        onTap: () => PageNavigator.push(context, MemberInfoPage(imgPath: 'assets/members/member3.png', info: memberInfo[2])),
                        imgPath: 'assets/members/member3.png',
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            memberCard(
                              onTap: () => PageNavigator.push(context, MemberInfoPage(imgPath: 'assets/members/member4.png', info: memberInfo[3])),
                              imgPath: 'assets/members/member4.png',
                            ),
                            memberCard(
                              onTap: () => PageNavigator.push(context, MemberInfoPage(imgPath: 'assets/members/member5.png', info: memberInfo[4])),
                              imgPath: 'assets/members/member5.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          )),
        ),
      ),
    );
  }

  Widget memberCard({required void Function()? onTap, required String imgPath}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Image.asset(imgPath),
      ),
    );
  }
}
