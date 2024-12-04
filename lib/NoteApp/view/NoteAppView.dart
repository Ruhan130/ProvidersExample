import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/NoteApp/provider/NoteappProvider.dart';


import 'package:provider/provider.dart';

class DynamicTextFieldScreen extends StatelessWidget {
  const DynamicTextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldProvider = Provider.of<TextFieldProvider>(context);

    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: const Text('Note App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: textFieldProvider.controllers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Focus(
                onKey: (FocusNode node, RawKeyEvent event) {
                  if (event is RawKeyDownEvent) {
                    if (event.logicalKey == LogicalKeyboardKey.enter) {
                      textFieldProvider.addNewTextField(index);
                      return KeyEventResult.handled;
                    }
                    if (event.logicalKey == LogicalKeyboardKey.backspace &&
                        textFieldProvider.controllers[index].text.isEmpty) {
                      textFieldProvider.removeTextField(index);
                      return KeyEventResult.handled;
                    }
                  }
                  return KeyEventResult.ignored;
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: textFieldProvider.checkboxes[index],
                      onChanged: (value) {
                        textFieldProvider.updateCheckbox(index, value!);
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: textFieldProvider.controllers[index],
                        focusNode: textFieldProvider.focusNodes[index],
                        decoration:  const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter text here...',
                        ),
                        textInputAction: TextInputAction.newline,
                        style: TextStyle(
                          color: textFieldProvider.checkboxes[index]
                              ? Colors.grey
                              : Colors.black,
                          decoration: textFieldProvider.checkboxes[index] &&
                                  textFieldProvider
                                      .controllers[index].text.isNotEmpty
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                        onChanged: (value) {
                          // Automatically remove the line-through if the user starts typing
                          if (value.isNotEmpty &&
                              textFieldProvider.checkboxes[index]) {
                            textFieldProvider.updateCheckbox(index, false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}