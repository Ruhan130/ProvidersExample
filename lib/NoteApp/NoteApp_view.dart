import 'package:flutter/material.dart';

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
        title: const Text(
          "Note App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
