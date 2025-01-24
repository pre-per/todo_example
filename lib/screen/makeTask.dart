import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/provider/taskProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/model/taskModel.dart';
import 'package:uuid/uuid.dart';

class Makelist extends StatefulWidget {

  Makelist({super.key});

  @override
  State<Makelist> createState() => _MakelistState();
}

class _MakelistState extends State<Makelist> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Task _task = Task(
    id: const Uuid().v4(),
    title: 'Empty Title',
    date: DateTime.now(),
    description: 'Empty Description',
  );

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
          title: const Text(
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
                const Text(
                  '제목',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '제목을 입력하세요',
                  ),
                  onSaved: (String? value) {
                    _task.title = value ?? 'Empty Title';
                  },
                  validator: (String? value) {
                    return (value == null) ? '값을 입력하세요' : null;
                  },
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '날짜',
                  style: S18W600_BLACK,
                ),
                const SizedBox(height: 5.0),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.utc(2000, 1, 1),
                        lastDate: DateTime.utc(2100, 1, 1));
                    print('selected Date: $selectedDate');
                    setState(() {
                      _task.date = selectedDate ?? DateTime.now();
                    });
                    print("_task.date: ${_task.date}");
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green[400],
                    ),
                    child: Center(
                      child: Text(
                        _task.date.toString().split(' ')[0],
                        style: S18W600_BLACK,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '내용',
                  style: S18W600_BLACK,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요',
                  ),
                  onSaved: (String? value) {
                    _task.description = value ?? 'Empty Description';
                  },
                  validator: (String? value) {
                    return (value == null) ? '값을 입력하세요' : null;
                  },
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.transparent,
                      child: const Center(
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
                        taskProvider.addTask(_task);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          '저장',
                          style: TextStyle(
                            color: (_formKey.currentState?.validate() ?? false)
                                ? Colors.black
                                : Colors.grey[600],
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
