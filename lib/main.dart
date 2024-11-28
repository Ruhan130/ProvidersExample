import 'package:flutter/material.dart';
import 'package:project/NoteApp/NoteProvider.dart';
import 'package:project/NoteApp/prac2.dart';
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
          //   ChangeNotifierProvider(
          //   create: (_) =>Noteprovider(),
          // ),
           ChangeNotifierProvider(
            create: (_) =>ExampleNoteProvider(),
          ),
           
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home:   NoteScreen1(),
        ));
  }
}