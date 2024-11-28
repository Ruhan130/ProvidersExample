import 'package:flutter/material.dart';
import 'package:project/NoteApp/NoteProvider.dart';
import 'package:project/NoteApp/prac';
import 'package:provider/provider.dart';

class NoteScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Notes with Provider'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ExampleNoteProvider>(
              builder: (context, noteProvider, child) {
                return ListView.builder(
                  itemCount: noteProvider.notes.length,
                  itemBuilder: (context, index) {
                    final note = noteProvider.notes[index];
                    return Row(
                      children: [
                        Checkbox(
                          value: note.isChecked,
                          onChanged: (value) {
                            noteProvider.toggleCheckbox(index);
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(text: note.text),
                            decoration: const InputDecoration(
                              hintText: 'Enter note...',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (newText) {
                              noteProvider.updateNoteText(index, newText);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ExampleNoteProvider>(context, listen: false).addNote();
              },
              child: Text('Add Note'),
            ),
          ),
        ],
      ),
    );
  }
}