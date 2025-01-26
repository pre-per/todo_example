import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> _searchData = [];
  List<String> get searchData => _searchData;

  void addSearchHistory(String content) {
    _searchData.add(content);
    notifyListeners();
  }

  void removeSearchHistory(String content) {
    _searchData.remove(content);
    notifyListeners();
  }
}