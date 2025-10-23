import 'package:flutter/material.dart';
import 'todo_entity.dart';

class AddTodoSheet extends StatefulWidget {
  const AddTodoSheet({super.key});

  @override
  State<AddTodoSheet> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends State<AddTodoSheet> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _titleFocus = FocusNode();

  bool _showDesc = false;
  bool _favorite = false;

  bool get _canSave => _titleCtrl.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    // 자동 포커스
    Future.microtask(() => _titleFocus.requestFocus());
    _titleCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _titleFocus.dispose();
    super.dispose();
  }

  void _save() {
    if (!_canSave) return;
    final todo = ToDoEntity(
      title: _titleCtrl.text.trim(),
      description: _showDesc && _descCtrl.text.trim().isNotEmpty
          ? _descCtrl.text.trim()
          : null,
      isFavorite: _favorite,
    );
    Navigator.of(context).pop(todo);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: bottomInset,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleCtrl,
              focusNode: _titleFocus,
              decoration: const InputDecoration(hintText: '새 할 일'),
              style: const TextStyle(fontSize: 16),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _save(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.short_text_rounded),
                  tooltip: '세부정보 추가',
                  onPressed: () => setState(() => _showDesc = !_showDesc),
                ),
                IconButton(
                  icon: Icon(_favorite ? Icons.star : Icons.star_border),
                  tooltip: '즐겨찾기',
                  onPressed: () => setState(() => _favorite = !_favorite),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _canSave ? _save : null,
                  child: const Text('저장'),
                ),
              ],
            ),
            if (_showDesc) ...[
              const SizedBox(height: 8),
              Expanded(
                child: TextField(
                  controller: _descCtrl,
                  decoration: const InputDecoration(hintText: '세부정보 추가'),
                  maxLines: null, // 줄바꿈 허용
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
