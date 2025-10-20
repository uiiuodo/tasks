import 'package:flutter/material.dart';

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
            Container(
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
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text("플러터 복습")),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
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
                      color: Colors.black,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 16),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text("운동하기")),
                ],
              ),
            ),
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
