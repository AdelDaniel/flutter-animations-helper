import 'package:flutter/material.dart';
import 'package:flutter_animation_helper/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Helper',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MainScreen(),
    );
  }
}
