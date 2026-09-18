import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_app/view/homepage.dart';
import 'package:todo_app/view/profile/profile_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: ProfileScreen(),
    );
  }
}