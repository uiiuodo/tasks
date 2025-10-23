import 'package:flutter/material.dart';
import 'todo_entity.dart';
import 'todo_widget.dart';
import 'add_todo_sheet.dart';
import 'todo_detail_page.dart';

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
      // 키보드와 무관하게 FAB 고정
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("가원`s Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _todos.isEmpty
            ? Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "할 일이 없음\n \n할 일을 추가하고 가원'Tasks에서\n할 일을 추적하세요.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
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
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
