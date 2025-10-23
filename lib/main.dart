import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '투투 앱',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20, // 글씨 크기 키움
            fontWeight: FontWeight.w700, // 굵게
          ),
        ),
      ),

      home: const HomePage(),
    );
  }
}
