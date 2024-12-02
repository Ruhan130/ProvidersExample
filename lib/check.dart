import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<FocusNode> _focusNodes = [FocusNode()];
  final List<bool> _checkboxes = [false];

  List<TextEditingController> get controllers => _controllers;
  List<FocusNode> get focusNodes => _focusNodes;
  List<bool> get checkboxes => _checkboxes;

  void addNewTextField(int index) {
    _controllers.insert(index + 1, TextEditingController());
    _focusNodes.insert(index + 1, FocusNode());
    _checkboxes.insert(index + 1, false);
    notifyListeners();

    Future.delayed(Duration(milliseconds: 100), () {
      _focusNodes[index + 1].requestFocus();
    });
  }

  void removeTextField(int index) {
    if (_controllers.length > 1) {
      _controllers[index].dispose();
      _focusNodes[index].dispose();
      _controllers.removeAt(index);
      _focusNodes.removeAt(index);
      _checkboxes.removeAt(index);
      notifyListeners();

      if (index > 0) {
        Future.delayed(Duration(milliseconds: 100), () {
          _focusNodes[index - 1].requestFocus();
        });
      } else if (_focusNodes.isNotEmpty) {
        Future.delayed(Duration(milliseconds: 100), () {
          _focusNodes[0].requestFocus();
        });
      }
    }
  }

  void updateCheckbox(int index, bool value) {
    _checkboxes[index] = value;
    notifyListeners();
  }
}