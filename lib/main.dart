import 'package:flutter/material.dart';

import 'package:zappchat_ui/Screens/mobileScreenLayout.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ZappChat UI',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: mobileScreenLayout()
        );
  }
}
