
import 'package:flutter/material.dart';
import 'package:project/Model/Note.dart';

class Noteprovider with ChangeNotifier{
  final List<Note> _notes = [];
  List<Note> get notes => _notes;


  void addNote(String tittle, String description){
    Note note = Note(tittle: tittle, description: description);
    _notes.add(note);
    notifyListeners();
  }

  // void addNewNodes(Note note){
  //   _notes.add(note);
  // }
}