import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/provider/taskProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/model/taskModel.dart';
import 'package:todo_example/screen/detailTask.dart';

class ListCard extends StatelessWidget {
  final Task task;

  const ListCard({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red[400],
        child: Center(
          child: Text(
            '오른쪽으로 밀어서 삭제',
            style: S20W600_WHITE,
          ),
        ),
      ),
      onDismissed: (direction) {
        taskProvider.removeTask(task.id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Deleted'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => Detailtask(task: task)),
          );
        },
        child: Card(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          color: Colors.white,
          elevation: 4.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: task.isChecked,
                        activeColor: Colors.brown[400],
                        onChanged: (newBool) {
                          taskProvider.toggleCheck(task);
                        },
                      ),
                      Text(
                        '완료 시 체크',
                        style: S12W600_BROWN,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: S20W600_BLACK,
                          softWrap: true,
                        ),
                        Text(
                          task.date.toString().split(' ')[0],
                          style: S15W500_GREY,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
