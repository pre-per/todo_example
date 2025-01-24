import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_example/model/taskModel.dart';

class TaskProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void listenToTasks() {
    firestore.collection('tasks').snapshots().listen((snapshot) {
      _tasks = snapshot.docs.map((doc) {
        return Task.fromMap(doc.data(), doc.id);
      }).toList();

      _sortTask();
      notifyListeners();
    });
  }

  Future<void> addTask(Task task) async {
    await firestore.collection('tasks').add(task.toMap());
  }

  Future<void> toggleCheck(Task task) async {
    await firestore
        .collection('tasks')
        .doc(task.id)
        .update({'isChecked': !task.isChecked});
    notifyListeners();
  }

  Future<void> changeDate(Task task, DateTime date) async {
    await firestore.collection('tasks').doc(task.id).update({'date': date});
    notifyListeners();
  }

  Future<void> removeTask(String taskId) async {
    try {
      await firestore.collection('tasks').doc(taskId).delete();
      notifyListeners();
    } catch (e) {
      print('Error removing task: $e');
    }
  }

  void _sortTask() {
    _tasks.sort((a, b) => a.date.compareTo(b.date));
  }

}
