import 'package:flutter/material.dart';
import 'package:todo_example/provider/taskProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/model/taskModel.dart';

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
        child: const Center(
          child: Text(
            '오른쪽으로 밀어서 삭제',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        taskProvider.removeTask(task.id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Deleted')),
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
                      activeColor: Colors.brown,
                      onChanged: (newBool) {
                        taskProvider.toggleCheck(task);
                      },
                    ),
                    const Text(
                      '완료 시 체크',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      task.date.toString().split(' ')[0],
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
