import 'package:flutter/material.dart';
import 'todo_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({super.key, required this.todo});
  final ToDoEntity todo;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late ToDoEntity _current;

  @override
  void initState() {
    super.initState();
    _current = widget.todo;
  }

  void _toggleFavorite() {
    setState(() {
      _current = _current.copyWith(isFavorite: !_current.isFavorite);
    });
  }

  void _goBack() {
    Navigator.pop(context, _current); // 변경된 객체를 돌려줘서 이전 화면 반영
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D6D6),
      appBar: AppBar(
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(_current.isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _current.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.notes, size: 18),
                SizedBox(width: 6),
                Text('세부 내용은 다음과 같습니다.'),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _current.description?.isNotEmpty == true
                  ? _current.description!
                  : '세부 내용은 여기에 작성합니다.',
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
