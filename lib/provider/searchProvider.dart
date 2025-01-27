import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/model/historyModel.dart';

class SearchProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<History> _searchData = [];
  List<History> get searchData => _searchData;

  void listenToHistory() {
    firestore.collection('searchHistory').snapshots().listen((snapshot) {
      _searchData = snapshot.docs.map((doc) {
        return History.fromMap(doc.data(), doc.id);
      }).toList();

      _sortHistory();
      notifyListeners();
    });
  }

  void addSearchHistory(History history) {
    firestore.collection('searchHistory').add(history.toMap());
    notifyListeners();
  }

  void removeSearchHistory(String historyId) async {
    try {
      await firestore.collection('searchHistory').doc(historyId).delete();
      notifyListeners();
    } catch(e) {
      print("Error removing history: $e ");
    }
  }
  
  void _sortHistory() {
    _searchData.sort((a,b) => b.date.compareTo(a.date));
  }
}