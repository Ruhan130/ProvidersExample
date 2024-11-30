import 'package:flutter/material.dart';
import 'package:project/NoteApp/NoteProvider.dart';
import 'package:project/check.dart';
import 'package:project/checklist.dart';
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
            create: (_) => ExampleNoteProvider(),
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
            onTap: (){
              FocusScopeNode currentNode = FocusScope.of(context);
              if(currentNode.focusedChild != null && !currentNode.hasPrimaryFocus){
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child:  DynamicTextFieldScreen(),
          ),
        ));
  }
}
