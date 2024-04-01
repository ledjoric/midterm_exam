import 'package:flutter/material.dart';
import 'package:midterm_exam/app/screens/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Brams'),
      ),
      home: const WelcomePage(),
    );
  }
}
