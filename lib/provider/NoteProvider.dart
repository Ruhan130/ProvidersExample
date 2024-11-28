
import 'package:flutter/material.dart';
import 'package:project/Model/Note.dart';

class Noteprovider extends ChangeNotifier{

  List<Note> _task = [ 
    Note(tittle: "My name is Rohan"),
  ]; 
  List<Note> get task => _task;


  void addTask(Note note){
    task.add(note);
    notifyListeners();
  }



  // final List<Note> _notes = [];
  // List<Note> get notes => _notes;


  // NoteOperation(){
  //   addNote("First", "This is  my Description");
  // }  

  //  addNote(String tittle, String description){
  //   Note note = Note(tittle: tittle, description: description);
  //   _notes.add(note);
  //   notifyListeners();
  // }

  // void addNewNodes(Note note){
  //   _notes.add(note);
  // }
}