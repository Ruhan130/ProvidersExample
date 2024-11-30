import 'package:flutter/material.dart';
import 'package:project/NoteApp/AddTaskScreen.dart';
import 'package:project/provider/NoteProvider.dart';
import 'package:provider/provider.dart';

class NoteappView extends StatefulWidget {
  const NoteappView({super.key});

  @override
  State<NoteappView> createState() => _NoteappViewState();
}

class _NoteappViewState extends State<NoteappView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        centerTitle: true,
        title: const Text(
          "Note App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<Noteprovider>(
        builder: (
          context,
          task,
          child,
        ) {
          return ListView.builder(
              itemCount: task.task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(task.task[index].tittle),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteScreen(),
            ),
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
