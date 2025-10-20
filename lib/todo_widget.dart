import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  TodoWidget({required this.content, required this.isDone});

  String content;
  bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12),
              color: isDone ? Colors.black : null,
            ),
            child: isDone
                ? Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          SizedBox(width: 20),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }
}
