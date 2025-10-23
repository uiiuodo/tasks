import 'package:flutter/material.dart';

class NoTodoView extends StatelessWidget {
  const NoTodoView({super.key, required this.appTitle});
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20), // padding 20
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12), // 라운드 12
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ⬇️ 이미지 영역(보더 넣어서 영역 보이게)
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,

            child: Image.asset(
              'assets/images/add_file.png', // PNG로 등록했으니 .png!
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              // ⬇️ 경로/등록 문제면 바로 빨간 에러아이콘 뜸
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.error, color: Colors.red, size: 40),
            ),
          ),
          const SizedBox(height: 12),
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
