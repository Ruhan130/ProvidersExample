import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/check.dart';
import 'package:provider/provider.dart';

class DynamicTextFieldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textFieldProvider = Provider.of<TextFieldProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Text Fields with Checkbox'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: textFieldProvider.controllers.length,
                itemBuilder: (context, index) {
                  final textWidth = _getTextWidth(
                    textFieldProvider.controllers[index].text,
                    TextStyle(fontSize: 16),
                  );

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Stack(
                      children: [
                        if (textFieldProvider.checkboxes[index])
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 22,
                            child: Container(
                              height: 2,
                              color: Colors.red,
                              width: textWidth,
                            ),
                          ),
                        Row(
                          children: [
                            Checkbox(
                              value: textFieldProvider.checkboxes[index],
                              onChanged: (value) {
                                textFieldProvider.updateCheckbox(index, value!);
                              },
                            ),
                            Expanded(
                              child: RawKeyboardListener(
                                focusNode: textFieldProvider.focusNodes[index],
                                onKey: (RawKeyEvent event) {
                                  // Backspace pressed, remove text field if it's empty
                                  if (event.isKeyPressed(LogicalKeyboardKey.backspace) &&
                                      textFieldProvider.controllers[index].text.isEmpty &&
                                      textFieldProvider.controllers.length > 1) {
                                    // Remove text field and shift focus
                                    textFieldProvider.removeTextField(index);

                                    // Shift focus to the previous field if possible
                                    if (index > 0) {
                                      FocusScope.of(context).requestFocus(
                                        textFieldProvider.focusNodes[index - 1],
                                      );
                                    } else if (index == 0 && textFieldProvider.controllers.isNotEmpty) {
                                      FocusScope.of(context).requestFocus(
                                        textFieldProvider.focusNodes.first,
                                      );
                                    }
                                  }
                                },
                                child: TextField(
                                  controller: textFieldProvider.controllers[index],
                                  autofocus: index == textFieldProvider.controllers.length - 1,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter text here...',
                                  ),
                                  style: TextStyle(
                                    color: textFieldProvider.checkboxes[index]
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                  onChanged: (value) {
                                    if (value.endsWith('\n')) {
                                      textFieldProvider.addNewTextField();
                                      FocusScope.of(context).requestFocus(
                                        textFieldProvider.focusNodes.last,
                                      );
                                    }
                                  },
                                  onSubmitted: (value) {
                                    textFieldProvider.addNewTextField();
                                    FocusScope.of(context).requestFocus(
                                      textFieldProvider.focusNodes.last,
                                    );
                                  },
                                  textInputAction: TextInputAction.newline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size.width;
  }
}