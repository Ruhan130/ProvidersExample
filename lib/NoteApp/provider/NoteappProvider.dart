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

    // Focus on the newly added textfield
    Future.delayed(Duration(milliseconds: 100), () {
      _focusNodes[index + 1].requestFocus();
    });
  }

  void removeTextField(int index) {
    if (_controllers.length > 1) {
      // Dispose controllers and focus nodes
      _controllers[index].dispose();
      _focusNodes[index].dispose();
      _controllers.removeAt(index);
      _focusNodes.removeAt(index);
      _checkboxes.removeAt(index);
      notifyListeners();

      // Focus on the next textfield, or the previous one if it was the last
      Future.delayed(Duration(milliseconds: 100), () {
        if (index < _focusNodes.length) {
          _focusNodes[index].requestFocus();
        } else if (index - 1 >= 0) {
          _focusNodes[index - 1].requestFocus();
        }
      });
    }
  }

  void updateCheckbox(int index, bool value) {
    _checkboxes[index] = value;
    notifyListeners();
  }
}