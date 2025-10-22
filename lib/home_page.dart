import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tasks/todo.dart';
import 'package:tasks/todo_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  List<Todo> todoList = [];

  void onCreate() {
    setState(() {
      Todo newTodo = Todo(title: controller.text, isDone: false);
      todoList.add((newTodo));
      print(todoList.length);
    });
  }

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

        body: ListView.separated(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 200),
          itemCount: todoList.length,
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemBuilder: (context, index) {
            Todo todo = todoList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  todo.isDone = !todo.isDone;
                });
              },

              child: TodoWidget(content: todo.title, isDone: todo.isDone),
            );
          },
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
