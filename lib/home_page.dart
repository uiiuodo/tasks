import 'package:flutter/material.dart';
import 'todo_entity.dart';
import 'todo_widget.dart';
import 'add_todo_sheet.dart';
import 'todo_detail_page.dart';
import 'no_todo_view.dart'; // ⬅️ 추가

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ToDoEntity> _todos = [];

  Future<void> _addTodo() async {
    final ToDoEntity? created = await showModalBottomSheet<ToDoEntity>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTodoSheet(),
    );
    if (created != null) {
      setState(() => _todos.insert(0, created));
    }
  }

  void _toggleDone(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(
        isFavorite: !_todos[index].isFavorite,
      );
    });
  }

  Future<void> _openDetail(int index) async {
    final ToDoEntity? updated = await Navigator.push<ToDoEntity>(
      context,
      MaterialPageRoute(builder: (_) => ToDoDetailPage(todo: _todos[index])),
    );
    if (updated != null) {
      setState(() => _todos[index] = updated);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // FAB 고정
      backgroundColor: const Color(0xFFD6D6D6),
      appBar: AppBar(title: const Text("가원`s Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _todos.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [NoTodoView(appTitle: "가원`s Tasks")],
              )
            : ListView.separated(
                itemCount: _todos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) => TodoWidget(
                  todo: _todos[index],
                  onToggleDone: () => _toggleDone(index),
                  onToggleFavorite: () => _toggleFavorite(index),
                  onTap: () => _openDetail(index),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Color(0xFF5C6BC0), // ✅ 버튼 색 변경
        shape: const CircleBorder(), // ✅ 원형 보장
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
