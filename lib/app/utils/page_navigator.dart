import 'package:flutter/material.dart';

class PageNavigator {
  static push(BuildContext context, Widget route) => Navigator.push(context, MaterialPageRoute(builder: (_) => route));

  static pushAndRemoveStack(BuildContext context, dynamic route) =>
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => route), (Route<dynamic> route) => false);
}
