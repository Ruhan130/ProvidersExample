import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<Widget> _noteItems = [];
  final TextEditingController _controller = TextEditingController();

  void _addNewLine() {
    setState(() {
      _noteItems.add(
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {
                // Handle checkbox toggle
              },
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text here...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusNode FieldOne = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    // Handle checkbox toggle
                  },
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    focusNode: FieldOne,
                    onEditingComplete: () {
                      
                    },
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      hintText: 'Enter your first note...',
                    ),
                    onFieldSubmitted: (value) {
                      // Clear the text field on submit
                      _controller.clear();
                      _addNewLine();
                     
                    },
                    
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _noteItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
