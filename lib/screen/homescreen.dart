import 'package:flutter/material.dart';
import 'package:todo_example/component/taskCard.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/provider/taskProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/screen/makeTask.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Text(
          'To-Do List Example',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Search Button Clicked");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("More_Vert Button Clicked");
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: BACKGROUND_COLOR,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Today'),
              onTap: () {
                Navigator.pop(context); // 메뉴 닫기
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('etc'),
              onTap: () {
                Navigator.pop(context); // 메뉴 닫기
              },
            ),
          ],
        ),
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListCard(task: taskProvider.tasks[index]);
          },
          itemCount: taskProvider.tasks.length,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100.0,
        color: BACKGROUND_COLOR,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print('Add Today\'s plan');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '  Add Today\'s plan',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 그림자 색상
                    blurRadius: 5.0, // 흐림 효과 반경
                    offset: const Offset(3, 4), // 그림자 위치
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Makelist()),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}