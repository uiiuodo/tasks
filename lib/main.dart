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
          backgroundColor: Color(0xFFF4F4F4), // 💚 상단 밝은 민트색
          foregroundColor: Colors.black, // 🖤 글씨색 (가원`s Tasks)
          titleTextStyle: TextStyle(
            fontSize: 20, // 글씨 크기 키움
            fontWeight: FontWeight.w700,
            color: Colors.black, // 굵게
          ),
        ),
      ),

      home: const HomePage(),
    );
  }
}
