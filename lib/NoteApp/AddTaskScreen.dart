import 'package:flutter/material.dart';
import 'package:project/Model/Note.dart';
import 'package:project/NoteApp/NoteAppScreen.dart';
import 'package:project/main.dart';
import 'package:project/provider/NoteProvider.dart';
import 'package:provider/provider.dart';

class Addtaskscreen extends StatelessWidget {
  Addtaskscreen({super.key});

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter Jo dil karay"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                 if (controller.text.isNotEmpty) {
                context.read<Noteprovider>().addTask(
                  Note(tittle: controller.text)
                );
              }
                controller.clear(); // Clear the text field after adding the task
              },
              child: Text("ADd"),
            ),
          ],
        ),
      ),
    );
  }
}
