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
          style: S20W600_BLACK,
        ),
        centerTitle: true,
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RenderDetailTask(name: '제목', content: task.title),
            RenderDetailTask(name: '날짜', content: task.date.toString().split(' ')[0]),
          ],
        ),
      ),
    );
  }
}

class RenderDetailTask extends StatelessWidget {
  final String name;
  final String content;

  const RenderDetailTask({
    required this.name,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' $name',
          style: S20W600_BLACK,
        ),
        const SizedBox(height: 5.0),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              style: S20W500_BLACK,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
