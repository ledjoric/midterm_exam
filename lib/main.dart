import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/utils/shared_preference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}
