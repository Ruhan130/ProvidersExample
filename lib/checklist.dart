import 'package:flutter/material.dart';
import 'package:project/check.dart';
import 'package:provider/provider.dart';

class DynamicTextFieldScreen extends StatelessWidget {
  const DynamicTextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldProvider = Provider.of<TextFieldProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Text Fields with Checkbox'),
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
                    const TextStyle(fontSize: 16),
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
                              child: TextField(
                                controller: textFieldProvider.controllers[index],
                                autofocus: index == textFieldProvider.controllers.length - 1,
                                enabled: !textFieldProvider.checkboxes[index], // Disable text field if checkbox is checked
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
                                  // Automatically add a new field on Enter
                                  if (value.endsWith('\n')) {
                                    textFieldProvider.addNewTextField();
                                  }
                                },
                                onSubmitted: (value) {
                                  textFieldProvider.addNewTextField();
                                },
                                textInputAction: TextInputAction.newline,
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