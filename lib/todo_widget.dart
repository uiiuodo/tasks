import 'package:flutter/material.dart';
import 'todo_entity.dart';

class TodoWidget extends StatelessWidget {
  final ToDoEntity todo;
  final VoidCallback onToggleDone;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const TodoWidget({
    super.key,
    required this.todo,
    required this.onToggleDone,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 완료 토글
              IconButton(
                onPressed: onToggleDone,
                icon: Icon(
                  todo.isDone ? Icons.check_circle : Icons.circle_outlined,
                  color: todo.isDone ? Colors.green : null,
                ),
              ),
              const SizedBox(width: 8),
              // 제목
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              // 즐겨찾기 토글
              IconButton(
                onPressed: onToggleFavorite,
                icon: Icon(todo.isFavorite ? Icons.star : Icons.star_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
