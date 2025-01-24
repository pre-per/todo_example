import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/model/taskModel.dart';

class Detailtask extends StatelessWidget {
  final Task task;

  const Detailtask({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          'Detail Task',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  task.date.toString().split(' ')[0],
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  task.description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
