import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
 
  List<TextEditingController> _controllers = [TextEditingController()];
  List<bool> _checkboxes = [false];

  List<TextEditingController> get controllers => _controllers;
  List<bool> get checkboxes => _checkboxes;

  void addNewTextField() {
    _controllers.add(TextEditingController());
    _checkboxes.add(false);
    notifyListeners();
  }

  void updateCheckbox(int index, bool value) {
    _checkboxes[index] = value;
    notifyListeners();
  }

  // Method to remove a text field when it becomes empty
  void removeTextField(int index) {
    if (_controllers.length >1) {
      _controllers.removeAt(index);
      _checkboxes.removeAt(index);
      notifyListeners();
    }
  }
}
