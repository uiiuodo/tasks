import 'package:flutter/material.dart';

class NoTodoView extends StatelessWidget {
  const NoTodoView({super.key, required this.appTitle});

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // padding 20
      decoration: BoxDecoration(
        color: Colors.grey[200], // 배경색
        borderRadius: BorderRadius.circular(12), // 라운딩 12
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🟩 이미지 부분
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/add_file.png', // 네가 넣은 이미지 경로
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12), // 요소 간 간격
          const Text(
            '아직 할 일이 없음',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Text(
            '할 일을 추가하고 $appTitle에서\n할 일을 추적하세요.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}
