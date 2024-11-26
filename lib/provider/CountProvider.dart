import 'package:flutter/material.dart';

class Countprovider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void addCount() {
    _count++;
    notifyListeners();
  }

  void subCount() {
    if (_count >0) {
      _count--;
    }
    notifyListeners();
  }
}
