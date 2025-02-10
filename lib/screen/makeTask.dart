import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/provider/taskProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/model/taskModel.dart';
import 'package:todo_example/screen/categorySetting.dart';
import 'package:uuid/uuid.dart';

class Makelist extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Task task = Task(
    id: const Uuid().v4(),
    title: 'Empty Title',
    date: DateTime.now(),
    category: 'no category',
  );

  Makelist({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: BACKGROUND_COLOR,
          title: Text(
            'New To-do Plan',
            style: S20W600_BLACK,
          ),
          centerTitle: true,
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 0.1, color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: '제목',
                            hintStyle: S20W600_GREY,
                            border: InputBorder.none,
                          ),
                          onChanged: (String? value) {
                            task.title = value ?? 'Empty Title';
                          },
                          validator: (String? value) {
                            return (value == null) ? '값을 입력하세요' : null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.check_circle_outline,
                                    color: Colors.grey)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.photo_camera_back,
                                    color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.utc(2000, 1, 1),
                        lastDate: DateTime.utc(2100, 1, 1));
                    task.date = selectedDate ?? DateTime.now();
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                        task.date.toString().split(' ')[0],
                        style: S18W600_BLACK,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () {},
                  child: RenderTaskListTile(icon: Icons.calendar_month, text: '시간'),
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {},
                  child: RenderTaskListTile(icon: Icons.place, text: '장소'),
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Categorysetting())
                    );
                  },
                  child: RenderTaskListTile(icon: Icons.notifications, text: '카테고리 설정'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            color: BACKGROUND_COLOR,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          '취소',
                          style: S21W600_BLACK,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        taskProvider.addTask(task);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          '할 일 저장하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

class RenderTaskListTile extends StatelessWidget {
  IconData icon;
  String text;

  RenderTaskListTile({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(width: 0.1, color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 10.0),
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 30.0),
              Text(text, style: S20W600_GREY),
            ],
          ),
        ),
      ),
    );
  }
}


class RenderTodoTextFormField extends StatelessWidget {
  Task task;

  RenderTodoTextFormField({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: Colors.red,
    );
  }
}
