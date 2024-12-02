import 'package:flutter/material.dart';

import 'package:project/NoteApp/provider/NoteAppProvider.dart';
import 'package:project/NoteApp/NoteAppView.dart';
import 'package:project/provider/ExampleOneProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Exampleoneprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TextFieldProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: GestureDetector(
            onTap: () {
              FocusScopeNode currentNode = FocusScope.of(context);
              if (currentNode.focusedChild != null &&
                  !currentNode.hasPrimaryFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: const DynamicTextFieldScreen(),
          )),
    );
  }
}
