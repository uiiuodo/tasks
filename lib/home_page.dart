import 'package:flutter/material.dart';
import 'package:tasks/todo_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("가원's Tasks")),

        body: ListView(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 200),
          children: [
            TodoWidget(content: "플러터 복습", isDone: false),

            SizedBox(height: 20),

            TodoWidget(content: "운동하기", isDone: true),
          ],
        ),

        bottomSheet: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 40),
          child: TextField(
            controller: controller,
            maxLines: 1,
            onSubmitted: (value) {
              print("여기서도 투두 추가할거임");
              print(value);
            },
            decoration: InputDecoration(
              hintText: "새 할 일",
              border: InputBorder.none,
              fillColor: Colors.blue.withValues(alpha: 0.1),
              filled: true,
              suffixIcon: GestureDetector(
                onTap: () {
                  print("아이템 추가할거임");
                  print(controller.text);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
              suffixIconConstraints: BoxConstraints(),
            ),
          ),
        ),
      ),
    );
  }
}
