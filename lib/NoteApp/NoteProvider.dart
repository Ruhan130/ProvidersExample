
import 'package:flutter/material.dart';
import 'package:project/NoteApp/prac';

class ExampleNoteProvider extends ChangeNotifier {
  List<NoteItem> _notes = [];

  List<NoteItem> get notes => _notes;

   void updateNoteText(int index, String newText) {
    if (index < _notes.length) {
      _notes[index].text = newText;
      notifyListeners();
    }
  }
  void addNote() {
    if (_notes.length < 10) {
      _notes.add(NoteItem(text: '', isChecked: false));
      notifyListeners();
    }
  }

  void toggleCheckbox(int index) {
    if (index < _notes.length) {
      _notes[index].isChecked = !_notes[index].isChecked;
      notifyListeners();
    }
  }



}